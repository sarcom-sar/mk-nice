CC := gcc
CFLAGS := -Wall -I/usr/local/include
UNITY := ./Unity
LINKLIBS := /usr/local/lib/libcargs.a

all: mk-nice

mk-nice: mk-nice.c $(LINKLIBS)
	$(CC) $(CFLAGS) -o $@ $^

test: mk-nice standard_01 result_01
	@cmp result_01 standard_01; RETVAL=$$?;

standard_01:
	@echo "<html>\n<head>\n<style type=\"text/css\"> body { margin: 40px auto; max-width: 650px; line-height: 1.6; font-size: 18px; color: #444; padding: 0 10px } h1,h2,h3 { line-height: 1.2 } </style>\n</head>\n<body>\n</body>\n</html>" > standard_01

result_01: test_01
	@./mk-nice < test_01 > result_01

test_01:
	@echo "" > test_01

clean:
	rm mk-nice $(wildcard test_*) $(wildcard result_*) $(wildcard standard_*)
