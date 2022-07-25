%% Building word network
HParse_Command = ['HParse dictionary\wordGrammar dictionary\wordNet']
dos(HParse_Command)
HLstatsCommand = ['HLStats -b dictionary\wordLM.txt -o Keywords labels\Train_Labels.mlf']
dos(HLstatsCommand)
HBuild_Command = ['HBuild -b -n dictionary\wordLM.txt Keywords2 dictionary\wordLM_Net']
dos(HBuild_Command)