 
info:
	clear	
	@echo ========================================================
	@echo You can choose which kind action you need
	@echo type: make launch  -------for make ./lauch exe
	@echo type: make mygprof -------for prof
	@echo type: make mylcov  -------for grof
	@echo type: make clean   -------for clean 
	@echo type: make generate ------for generating A and B matrix
	@echo ========================================================
	@echo Result is included in x.txt file

launch: jacobi.cpp
	gcc --coverage jacobi.cpp -o launch -lstdc++
	ctags -R .
	./launch
	@gcov jacobi.cpp -m

mygprof: jacobi.cpp
	gcc -pg jacobi.cpp -o launch -lstdc++
	gprof launch gmon.out


mylcov:	jacobi.cpp
	gcc --coverage jacobi.cpp -o launch -lstdc++
	./launch
	lcov -t "result" -o ex_text.info -c -d .

mygcov: Jacobi.cpp
	genhtml -o rs ex_text.info
	xdg-open ./rs/index.html  #you need xdg-open in your pc
  
generate:
	make -f make_gener clean
	make -f make_gener
	./glaunch	
clean:
	rm -rf launch

