import sys
import statistics
import math

def print_value_from_data(data, key, prefix, delimiter, sufix):
    line = prefix
    for measurement in data:
        line += delimiter.format(measurement[key])
    line += sufix
    print(line)


files = sys.argv[1:]
data = []
for file_name in files:
    with open(file_name, 'r') as file:
        lines = [line.rstrip('\n') for line in file.readlines()]
        float_values = list(map(float,lines[1:]))
        data.append({"name" : lines[0], 
                     "entry_length" : len(lines[2]),
                     "mean" : statistics.mean(float_values),
                     "stdev" : statistics.stdev(float_values),
                     "mean_stdev" : statistics.stdev(float_values) / math.sqrt(len(float_values)),
                     "values" : lines[1:],
                     })

        data[-1]["value"] = "{} ({})".format(str(data[-1]["mean"]), str(data[-1]["mean_stdev"]))

print("\\begin{table}[ht]")
print("\\centering")
print("")
print("\\begin{tabular}{| r |" +  " r |"*len(data) + "}")
print("\\hline")

print_value_from_data(data, "name", "i", " & {}", " \\\\")
print("\\hline\\hline")

maxlength = max(len(measurement["values"]) for measurement in data)
for i in range(maxlength):
    line = "{}".format(i+1)
    for measurement in data:
        if len(measurement["values"]) > i:
            line += " & {}".format(measurement["values"][i])
        else:
            line += " & " + " "*measurement["entry_length"]

    print(line + " \\\\")

print("\\hline\\hline")
print_value_from_data(data, "mean", "$\\bar{x}$", " & {}", " \\\\\\hline")
print_value_from_data(data, "mean_stdev", "$u$", " & {}", " \\\\\\hline")
print_value_from_data(data, "value", "x", " & {}", " \\\\\\hline")
print("")
print("\\end{tabular}")
print("\\caption{Naměřené hodnoty...}")
print("\\label{tb:mer}")
print("\\end{table}")
