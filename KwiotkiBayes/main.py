from bs4 import BeautifulSoup
from pgmpy.factors.discrete import TabularCPD
from pgmpy.models import BayesianNetwork

# Creating Bayesian Network from text export from GeNIe


class MyCPD:
    def __init__(self, name, states, probs, cpd_parents=None):
        self.name = name
        self.states = states
        self.probs = probs
        if cpd_parents:
            self.parents = cpd_parents
        else:
            self.parents = []

        for parent in self.parents:
            parent_list.append((parent, self.name))

        self.states_names = {name: states}


def get_ev_cards(parents):
    return [len(cpds_done[parent].states) for parent in parents]


def get_state_names(parents, cpd: MyCPD):
    cpd_states_names = {key: val for key, val in cpd.states_names.items()}
    for parent in parents:
        cpd_states_names.update(cpds_done[parent].states_names)
    return cpd_states_names


def parse_states(state_list):
    return [state['id'] for state in state_list]


def parse_parents(parents_list):
    return parents_list.string.split()


def parse_probabilities(states_no, probabilities):
    probabilities = probabilities.split()
    probs = [[] for _ in range(states_no)]
    i = 0
    for p in probabilities:
        probs[i].append(float(p))
        i = (i + 1) % states_no
    return probs


def parse_res_states(res_states):
    probabilities = res_states.string.replace('Nie', '0.0')
    probabilities = probabilities.replace('Tak', '1.0')
    probs = [float(p) for p in probabilities.split()]
    con_probs = [1 - p for p in probs]
    return [probs, con_probs]


def no_parents_cpd(cpd_form):
    cpd_name = cpd_form['id']
    cpd_states = parse_states(cpd_form.find_all('state'))
    cpd_probabilities = parse_probabilities(len(cpd_states), cpd_form.probabilities.string)

    cpd = MyCPD(cpd_name, cpd_states, cpd_probabilities)
    return cpd


def flower_nodes_cpd(cpd_form):
    cpd_name = cpd_form['id']
    cpd_states = parse_states(cpd_form.find_all('state'))
    cpd_parents = parse_parents(cpd_form.parentss)
    resulting_states = parse_res_states(cpd_form.resultingstates)

    cpd = MyCPD(cpd_name, cpd_states, resulting_states, cpd_parents)
    return cpd


def node_with_parents(cpd_form):
    cpd_name = cpd_form['id']
    cpd_states = parse_states(cpd_form.find_all('state'))
    cpd_probabilities = parse_probabilities(len(cpd_states), cpd_form.probabilities.string)
    cpd_parents = parse_parents(cpd_form.parentss)

    return MyCPD(cpd_name, cpd_states, cpd_probabilities, cpd_parents)


def parse_cpd(cpd_form):
    if 'deterministic' in str(cpd_form):
        return flower_nodes_cpd(cpd_form)
    elif 'parents' in str(cpd_form):
        return node_with_parents(cpd_form)
    else:
        return no_parents_cpd(cpd_form)


with open('Kwiotki.txt') as f:
    text = f.read().replace('parents', 'parentss')

soup = BeautifulSoup(text, 'html.parser')

nodes = BeautifulSoup(str(soup.nodes), 'html.parser')
cpds = nodes.findAll('cpt')
cpds.extend(nodes.findAll('deterministic'))

cpds_not_done = {}
cpds_done = {}
cpds_model = []
parent_list = []

for cpd in cpds:
    cpds_not_done[cpd['id']] = cpd

for cpd_id, cpd in cpds_not_done.items():
    cpds_done[cpd_id] = parse_cpd(cpd)

for cpd_id, cpd in cpds_done.items():
    print(cpd_id, cpd.name, cpd.states, cpd.parents)
    if cpd.parents:
        tcpd = TabularCPD(cpd.name, len(cpd.states), cpd.probs,
                          evidence=cpd.parents, evidence_card=get_ev_cards(cpd.parents),
                          state_names=get_state_names(cpd.parents, cpd))
    else:
        tcpd = TabularCPD(cpd.name, len(cpd.states), cpd.probs, state_names=cpd.states_names)

    cpds_model.append(tcpd)

model = BayesianNetwork(parent_list)
model.add_cpds(*cpds_model)

# model.check_model()
# daft = model.to_daft()
# daft.render()

# cpds_not_done = [*cpds]
# cpds_no_parents = [cpd for cpd in cpds_not_done if 'parents' not in str(cpd)]
# print(cpds_no_parents)
#
# cpds_dict = {}
# for cpd in cpds_no_parents
# print(cpds_not_done)
