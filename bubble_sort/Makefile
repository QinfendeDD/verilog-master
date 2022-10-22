############################################
#----------define timescale---------------
###########################################
TIMESCALE = 1ns/100ps

#########################################
#----------pre-simulation--------------
#######################################

all:
	vcs \
	verdi 


vcs:
	vcs -f filelist.f +v2k -full64 -debug_acc+all -R \
	-l sim.log -fsdb \
	-sverilog \
	+lint=TFIPC-L \
	-timescale=$(TIMESCALE)
       


cle:
	rm -rf csrc* simv* *.log nLint.rc \
	*.h cm* .vcsmx_rebuild vcs.key *.vcd *.fsdb \
	*buf.dat verdiLog nLint* *.key DebussyLog \
	inter.vpd DVEfiles novas.conf novas.fsdb.* sim.fsdb.*

verdi:
	verdi -2001 -f filelist.f -sv -ssf sim.fsdb -top tb &

