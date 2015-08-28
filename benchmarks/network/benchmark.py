#!/usr/bin/env python3

import os
import signal
import re
from subprocess import Popen, PIPE

class Alarm(Exception):
    pass

def alarm_handler(signum, frame):
    raise Alarm

def write_results_to_latex (results, path, name):
	latex_file = open(path + '/' + name + '.tex', 'w+')
	latex_file.write('\\begin{table}[!ht]\n\\centering\n\\small\n\\begin{tabular}{l')
	
	for i in range(0, len(results)):
		latex_file.write('|c')
	
	latex_file.write('}\n\\hline\n\\hline\n')
	
	latex_file.write('Iteration')
	
	for i in range(0, len(results)):
		description = results[i][0]
		latex_file.write(' & ' + description)
		
	latex_file.write(' \\\\\n')
	latex_file.write('\hline\n\hline\n')
	
	for j in range (min_boundary, max_boundary + 1):
		latex_file.write(str(j))
		
		for i in range(0, len(results)):
			result = results[i][1]
			i_res = min_boundary - j
			a_res = "-"
			if len(result) >= i_res:
				a_res = result[i_res]
			latex_file.write(' & ' + a_res)
			
		latex_file.write(' \\\\\n')
		
	latex_file.write('\\hline\n\\hline\n')
	
	latex_file.write('\\end{tabular}\n\\caption{\\small\nBenchmark results\n}\n\\label{tbl:bench}\n\\end{table}')
	latex_file.flush()
	latex_file.close()

if __name__ == '__main__':
	timeout = 10*60 # 10 Minute timeout
	heuristic = True
	dreach = '/home/alex/Documents/actual/dreal3/bin/dReach'
	dreach_bin = os.path.abspath(dreach)
	dreach_exec = [dreach_bin, '-n']
	
	dreal2 = '/home/alex/Documents/dreal2/dreal2/bin/dReal'
	dreal2_bin = os.path.abspath(dreal2)
	dreal3 = '/home/alex/Documents/actual/dreal3/bin/dReal'
	dreal3_bin = os.path.abspath(dreal3)
	dreal = [dreal2, dreal3]
	dreal_bin = [dreal2_bin, dreal3_bin]
	
	results = []
	
	max_boundary = 2
	min_boundary = 1
	break_on_sat = True
	
	if not heuristic:
		dreach_exec.extend(['-d'])
	else:
		dreach_exec.extend(['-b'])
		
	main_path =  os.path.dirname(os.path.abspath(__file__))
	out_path = main_path
	
	# List benchmark names (also directory name) and matching string for domain and problem instance, lower and upper instance bound
	# and instance iteration encoding.
	bench_info = {	'gen': ('gen-<i>-sat.drh', (1, 5), "%d"),
					'gen-unsat': ('gen-<i>-unsat.drh', (1, 5), "%d")
				 }
	
	bench_info_static = [
		                  [ # folder, description, generator script, expected result, dreal version (0 = dreal2, 1 = dreal3)
				            ("thermostat", "Thermostat Triple SAT", "thermostat-triple-sat.py", "sat", 0),
					        ("thermostat", "Thermostat Triple UNSAT", "thermostat-triple.py", "unsat", 0),
					        ("thermostat", "Thermostat Triple P SAT", "thermostat-triple-p-sat.py", "sat", 0),
					        ("thermostat", "Thermostat Triple P UNSAT", "thermostat-triple-p.py", "unsat", 0),
					        ("thermostat", "Thermostat Triple IND", "thermostat-triple-ind.py", "unsat", 0),
					        ("thermostat", "Thermostat Triple IND P", "thermostat-triple-ind-p.py", "unsat", 0) 
					      ],
				          [
					        ("thermostat", "Thermostat Double SAT", "thermostat-double-sat.py", "sat", 0),
					        ("thermostat", "Thermostat Double UNSAT", "thermostat-double.py", "unsat", 0),
					        ("thermostat", "Thermostat Double P SAT", "thermostat-double-p-sat.py", "sat", 0),
					        ("thermostat", "Thermostat Double P UNSAT", "thermostat-double-p.py", "unsat", 0),
					        ("thermostat", "Thermostat Double IND", "thermostat-double-ind.py", "unsat", 0),
					        ("thermostat", "Thermostat Double IND P", "thermostat-double-ind-p.py", "unsat", 0) 
					      ],
						  [
							("airplane", "Airplane UNSAT", "airplane.py", "unsat", 0),
							("airplane", "Airplane SAT", "airplane-sat.py", "sat", 0),
							("airplane", "Airplane P UNSAT", "airplane-p.py", "unsat", 0),
							("airplane", "Airplane P SAT", "airplane-p-sat.py", "sat", 0)
						  ],
						  [
							("airplane", "Airplane Single UNSAT", "airplane-single.py", "unsat", 0),
							("airplane", "Airplane Single SAT", "airplane-single-sat.py", "sat", 0),
							("airplane", "Airplane Single P UNSAT", "airplane-single-p.py", "unsat", 0),
							("airplane", "Airplane Single P SAT", "airplane-p-single-sat.py", "sat", 0)
						  ],
						  [
							("airplane-nl", "Airplane NL Single UNSAT", "airplane-single-nl.py", "unsat", 0),
							("airplane-nl", "Airplane NL Single SAT", "airplane-single-nl-sat.py", "sat", 0),
							("airplane-nl", "Airplane NL Single P UNSAT", "airplane-single-nl-p.py", "unsat", 0),
							("airplane-nl", "Airplane NL Single P SAT", "airplane-p-single-nl-sat.py", "sat", 0)
						  ] 
						]
						  
	
	# Check for translated directory
	merge_path = os.path.dirname(main_path)
	if not os.path.exists(merge_path):
		print('Directory: ' + merge_path + ' does not exist.')
	
	# Benchmark files
	for key in bench_info:
		bench_data = bench_info[key]
		
		domain = bench_data[0]
		bounds = bench_data[1]
		encode = bench_data[2]
		
		lower_bound = bounds[0]
		upper_bound = bounds[1]
		
		benchmark_path = os.path.dirname(main_path + '/' + key + '/')
		
		if not os.path.exists(benchmark_path):
			print('Directory: ' + benchmark_path + ' does not exist.')
			continue
		
		result_file_path = os.path.abspath(benchmark_path + '/results.txt')
		result_file = open(result_file_path, 'w+')
		
		# Run mcta for all instances
		for i in range(lower_bound, upper_bound + 1):
			instance_num = encode% i
			
			domain_inst = domain.replace('<i>', instance_num)
			domain_inst_path = os.path.abspath(benchmark_path + '/' + domain_inst)
			
			if not os.path.exists(domain_inst_path):
				print('Problem file: ' + domain_inst_path + ' does not exist.')
				continue
			
			run_result_sat = False
			run_time = ''
			cur_iter = 0;
			run_times = []
			
			for j in range (min_boundary, max_boundary + 1):
				benchmark_exec = list(dreach_exec)
				benchmark_exec.extend(['-l', str(j), '-k', str(j), domain_inst, '--stat'])
				print('Running iteration ' + str(j) + ': ' + domain_inst_path)
				p = Popen(benchmark_exec, stdin=PIPE, stdout=PIPE, stderr=PIPE, cwd=benchmark_path)
			
				# Set timeout signals
				signal.signal(signal.SIGALRM, alarm_handler)
				signal.alarm(timeout)
			
				proc_std = ('', '')
				proc_ret = 0
			
				# Try running solving process. Kill it in case it reaches the timeout threshold.
				try:
					proc_std = p.communicate()
					proc_ret = p.returncode
					signal.alarm(0)
				except Alarm:
					res_str = 'Benchmark for: ' + domain_inst_path + ' timed out after ' + str(timeout) + ' seconds.'
					print(res_str)
					result_file.write(res_str + '\n')
					
				# Get output data
				run_result_sat = len(filter(lambda x: x == 'sat', proc_std[0].splitlines())) > 0
				run_output = [map(str.strip, s.strip().split('=')) for s in filter(lambda x: '=' in x, proc_std[0].splitlines())]
				# Get run time
				run_time = filter(lambda x: 'Running time' in x, run_output)[0][1]
				run_time = "%.2f" % float(re.findall("\d+.\d+", run_time)[0])
				cur_iter = j
				run_times.append(run_time)
				
				print(run_time)
				
				result_file.write('Output for: ' + domain_inst_path + '\n')
				result_file.write(proc_std[0])
				result_file.flush()
				
				if break_on_sat and run_result_sat:
					break
				
			sat_str = 'sat' if run_result_sat else 'unsat'
			
			results.append([key + "-" + str(i), run_times, cur_iter, sat_str])
		result_file.close()
	write_results_to_latex(results, main_path, 'results-gen')
	for i in range(0, len(bench_info_static)):
		bench_data = bench_info_static[i]
		
		for j in range(0, len(bench_data)):
			folder = bench_data[j][0]
			description = bench_data[j][1]
			gen_file = bench_data[j][2]
			