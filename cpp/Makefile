run: ls

test:
	clang++ test.cpp -o test && ./test

buildtest:
	g++ -shared -o lib.so test.cpp

clean:
	rm -r test