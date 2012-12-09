VPATH = src
CXX := clang++
CXXFLAGS := -Wall -g -std=c++0x \
    -stdlib=libc++
objects = foolishgo.o
pos_cal_h = pos_cal.h def.h pos_cal-TLT.h pos_cal_TEST.h
board_h = board.h def.h position.h board-TLT.h board_TEST.h $(pos_cal_h)
chain_set_h = chain_set.h position.h $(pos_cal_h) chain_set_TEST.h \
	      chain_set-TLT.h
board_in_gm_h = board_in_gm.h $(board_h) $(chain_set_h) board_in_gm-TLT.h \
		board_in_gm_TEST.h bitset_util.h
edit : $(objects)
	clang++ -stdlib=libc++ -o a.out $(objects)
foolishgo.o : def.h $(board_h) $(pos_cal_h) $(board_in_gm_h) $(chain_set_h)
.PHONY : clean
clean :
	-rm a.out *.o
