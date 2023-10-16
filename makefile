CC := gcc
CFLAGS := -Wall -I/usr/local/include
UNITY := ./Unity
LINKLIBS := /usr/local/lib/libcargs.a

all: mk-nice

mk-nice: mk-nice.c $(LINKLIBS)
	$(CC) $(CFLAGS) -o $@ $^

test: mk-nice standard_01 result_01 standard_02 result_02
	@cmp result_01 standard_01; RETVAL=$$?;
	@cmp result_02 standard_02; RETVAL=$$?;

standard_01:
	@echo "<html>\n<head>\n<style type=\"text/css\"> body { margin: 40px auto; max-width: 650px; line-height: 1.6; font-size: 18px; color: #444; padding: 0 10px } h1,h2,h3 { line-height: 1.2 } </style>\n</head>\n<body>\n</body>\n</html>" > standard_01

standard_02:
	@echo "<html>\n<head>\n<style type=\"text/css\"> body { margin: 40px auto; max-width: 650px; line-height: 1.6; font-size: 18px; color: #444; padding: 0 10px } h1,h2,h3 { line-height: 1.2 } </style>\n</head>\n<body>Pellentesque dapibus suscipit ligula.  Donec posuere augue in quam.  Etiam vel tortor sodales tellus ultricies commodo.  Suspendisse potenti.  Aenean in sem ac leo mollis blandit.  Donec neque quam, dignissim in, mollis nec, sagittis eu, wisi.  Phasellus lacus.  Etiam laoreet quam sed arcu.  Phasellus at dui in ligula mollis ultricies.  Integer placerat tristique nisl.  Praesent augue.  Fusce commodo.  Vestibulum convallis, lorem a tempus semper, dui dui euismod elit, vitae placerat urna tortor vitae lacus.  Nullam libero mauris, consequat quis, varius et, dictum id, arcu.  Mauris mollis tincidunt felis.  Aliquam feugiat tellus ut neque.  Nulla facilisis, risus a rhoncus fermentum, tellus tellus lacinia purus, et dictum nunc justo sit amet elit.\n</body>\n</html>" > standard_02

result_01: test_01
	@./mk-nice < $? > $@

result_02: test_02
	@./mk-nice < $? > $@

test_01:
	@echo "" > test_01

test_02:
	@echo "Pellentesque dapibus suscipit ligula.  Donec posuere augue in quam.  Etiam vel tortor sodales tellus ultricies commodo.  Suspendisse potenti.  Aenean in sem ac leo mollis blandit.  Donec neque quam, dignissim in, mollis nec, sagittis eu, wisi.  Phasellus lacus.  Etiam laoreet quam sed arcu.  Phasellus at dui in ligula mollis ultricies.  Integer placerat tristique nisl.  Praesent augue.  Fusce commodo.  Vestibulum convallis, lorem a tempus semper, dui dui euismod elit, vitae placerat urna tortor vitae lacus.  Nullam libero mauris, consequat quis, varius et, dictum id, arcu.  Mauris mollis tincidunt felis.  Aliquam feugiat tellus ut neque.  Nulla facilisis, risus a rhoncus fermentum, tellus tellus lacinia purus, et dictum nunc justo sit amet elit." > test_02

clean:
	rm mk-nice $(wildcard test_*) $(wildcard result_*) $(wildcard standard_*)
