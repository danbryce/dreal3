/*********************************************************************
Author: Soonho Kong <soonhok@cs.cmu.edu>

dReal -- Copyright (C) 2013 - 2015, Soonho Kong, Sicun Gao, and Edmund Clarke

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

#pragma once
#include <pegtl.hh>
#include <cassert>
#include <exception>
#include <iostream>
#include <list>
#include <map>
#include <string>
#include <unordered_map>
#include <vector>
#include "opensmt/egraph/Enode.h"
#include "opensmt/api/OpenSMTContext.h"
#include "tools/dop/stacks.h"
#include "tools/dop/var_map.h"

namespace dop {

class pstate {
private:
    OpenSMTContext m_ctx;
    stacks         m_stacks;
    var_map        m_var_map;
    bool           m_var_decl_done = false;
    double         m_prec = 0.001;
    Enode *        m_cost;
    Enode *        m_ctr;
    std::pair<Enode *, Enode *> parse_formula_helper() {
        auto top_stack = m_stacks.get_top_stack();
        assert(top_stack.size() >= 2);
        Enode * rhs = top_stack.back();
        top_stack.pop_back();
        Enode * lhs = top_stack.back();
        top_stack.pop_back();
        return make_pair(lhs, rhs);
    }

public:
    pstate();
    void debug_stacks() const;
    bool is_var_decl_done() const { return m_var_decl_done; }
    void mark_var_decl_done() { m_var_decl_done = true; }
    OpenSMTContext & get_ctx() { return m_ctx; }
    Enode * get_cost() const { return m_cost; };
    void parse_cost() {
        m_cost = m_stacks.get_result();
    }
    Enode * get_ctr() const { return m_ctr; };
    void parse_formula_lt() {
        std::pair<Enode *, Enode *> nodes = parse_formula_helper();
        Enode * lhs = nodes.first;
        Enode * rhs = nodes.second;
        m_ctr = m_ctx.mkLt(m_ctx.mkCons(lhs, m_ctx.mkCons(rhs)));
    }
    void parse_formula_gt() {
        std::pair<Enode *, Enode *> nodes = parse_formula_helper();
        Enode * lhs = nodes.first;
        Enode * rhs = nodes.second;
        m_ctr = m_ctx.mkGt(m_ctx.mkCons(lhs, m_ctx.mkCons(rhs)));
    }
    void parse_formula_le() {
        std::pair<Enode *, Enode *> nodes = parse_formula_helper();
        Enode * lhs = nodes.first;
        Enode * rhs = nodes.second;
        m_ctr = m_ctx.mkLeq(m_ctx.mkCons(lhs, m_ctx.mkCons(rhs)));
    }
    void parse_formula_ge() {
        std::pair<Enode *, Enode *> nodes = parse_formula_helper();
        Enode * lhs = nodes.first;
        Enode * rhs = nodes.second;
        m_ctr = m_ctx.mkGeq(m_ctx.mkCons(lhs, m_ctx.mkCons(rhs)));
    }
    void parse_formula_eq() {
        std::pair<Enode *, Enode *> nodes = parse_formula_helper();
        Enode * lhs = nodes.first;
        Enode * rhs = nodes.second;
        m_ctr = m_ctx.mkEq(m_ctx.mkCons(lhs, m_ctx.mkCons(rhs)));
    }
    void parse_formula_neq() {
        std::pair<Enode *, Enode *> nodes = parse_formula_helper();
        Enode * lhs = nodes.first;
        Enode * rhs = nodes.second;
        m_ctr = m_ctx.mkNot(m_ctx.mkEq(m_ctx.mkCons(lhs, m_ctx.mkCons(rhs))));
    }

    // ============================
    // m_stacks (expression stacks)
    // ============================
    void push_back(double const v);
    void push_back(string const & s);
    void push_back_op(string const & s);
    void open();
    void close();
    void reduce(std::function<Enode*(OpenSMTContext & ctx, std::vector<Enode*> &, std::vector<std::string> &)> const & f);

    // =========
    // Precision
    // =========
    void set_precision(double const v) { m_prec = v; }
    double get_precision() const { return m_prec; }

    // ==============
    // var_map
    // ==============
    void push_num(double const n) { m_var_map.push_num(n); }
    double pop_num() { return m_var_map.pop_num(); }
    void push_id(std::string const & name) { m_var_map.push_id(name); }
    void push_var_decl() { m_var_map.push_var_decl(); }
    std::unordered_map<std::string, Enode *> get_var_map() const {
        return m_var_map.get_var_map();
    }
};
}  // namespace dop
