/*********************************************************************
Author: Daniel Bryce <dbryce@sift.net>

dReal -- Copyright (C) 2013 - 2016, the dReal Team

dReal is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

dReal is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with dReal. If not, see <http://www.gnu.org/licenses/>.
*********************************************************************/

#include <assert.h>
#include <math.h>
#include <limits>

#include "util/logging.h"
#include "util/mcts_expander.h"
#include "util/mcts_node.h"

using dreal::mcts_node;
using dreal::icp_mcts_node;
using std::numeric_limits;

mcts_node::~mcts_node(){
  vector<mcts_node*> *parent_children = this->parent()->children();
  auto it = std::find(parent_children->begin(), parent_children->end(), this);
  if(it != parent_children->end()){
    parent_children->erase(it);		
  }
  if(parent_children->empty()){
    delete parent();
  }
}

mcts_node * mcts_node::select() {
    mcts_node * selected = NULL;
    double max_score = numeric_limits<double>::lowest();

    // UCT score
    for (auto child : m_children_list) {
        // DREAL_LOG_INFO << m_value << " " << m_visits << " " << child->visits() << " " <<
        // max_score;
        double score = (child->value() / child->visits()) +
                       UCT_COEFFICIENT * sqrt(log(m_visits) / child->visits());
        child->set_score(score);
        // DREAL_LOG_INFO << "mcts_node::select(" << m_id
        //             << ") set score(" << child->id() << ") = " << score;
        if (score > max_score) {
            selected = child;
            max_score = score;
        }
    }

    DREAL_LOG_INFO << "mcts_node::select(" << m_id << ") = " << selected->id()
                   << ", score = " << max_score;
    return selected;
}

mcts_node * icp_mcts_node::expand() {
    DREAL_LOG_INFO << "mcts_node::expand(" << m_id << ")";
    assert(m_children_list.empty());

    if (!m_terminal) {
        m_expander->expand(this);
        m_size = m_children_list.size();

        DREAL_LOG_INFO << "mcts_node::expand(" << m_id << ")"
                       << " Got num children: " << m_children_list.size();

        for (auto child : m_children_list) {
            // DREAL_LOG_INFO << "child: " << child->id();
            child->inc_visits();
        }

        if (m_children_list.empty()) {
            m_terminal = true;
        }
    }

    return (m_terminal ? NULL  // (m_is_solution ? this : NULL)
                       : m_children_list[0]);
}

double mcts_node::simulate() {
    DREAL_LOG_INFO << "mcts_node::simulate(" << m_id << ")";

    if (m_terminal && !m_is_solution) {
        m_value = numeric_limits<double>::lowest();
    } else {
      //m_value = ((m_value * m_visits)+ m_expander->simulate(this))/(m_visits+1);
            m_value = (m_value+ m_expander->simulate(this))/2;
    }
    return m_value;
}

void mcts_node::backpropagate() {
    // DREAL_LOG_INFO << "mcts_node::backpropagate(" << m_id << ") size = " << m_size;
    m_visits++;
    if (!m_children_list.empty()) {
        m_size = 0;
        m_value = 0;
        for (auto child : m_children_list) {
            m_size += child->size() + 1;
            m_value += child->value();
        }
        m_value /= m_children_list.size();  // average value backprop
    }
    // else {
    //   m_size = 0;
    //   m_value = numeric_limits<double>::lowest();
    // }
    DREAL_LOG_INFO << "mcts_node::backpropagate(" << m_id << ") size = " << m_size << " value = " << m_value;
}

void icp_mcts_node::draw_dot(ostream & out) {
  bool is_root = (m_parent == NULL);
  out.precision(2);
  if(is_root){
    out << "digraph icp_mcts_graph {\n";
  }
  
  for(auto child : m_children_list){
    out << "\"" << this->id() << " : " << this->visits() << "\" -> \"" << child->id() << " : " << child->visits() << "\" [label=\""<< child->score() << "\"];\n";
    child->draw_dot(out);
  }
  
  if(is_root){
    out << "}";
  }
  
}
