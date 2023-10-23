CC := gcc
CFLAGS := -Wall -I/usr/local/include
UNITY := ./Unity
LINKLIBS := /usr/local/lib/libcargs.a

all: mk-nice

mk-nice: mk-nice.c $(LINKLIBS)
	$(CC) $(CFLAGS) -o $@ $^

test: mk-nice standard_01 result_01 standard_02 result_02 standard_03 result_03 standard_04 result_04 standard_05 result_05 standard_06 result_06 standard_07 result_07
	@cmp result_01 standard_01; RETVAL=$$?;
	@cmp result_02 standard_02; RETVAL=$$?;
	@cmp result_03 standard_03; RETVAL=$$?;
	@cmp result_04 standard_04; RETVAL=$$?;
	@cmp result_05 standard_05; RETVAL=$$?;
	@cmp result_06 standard_06; RETVAL=$$?;
	@cmp result_07 standard_07; RETVAL=$$?;

standard_01:
	@echo "<html>\n<head>\n<meta charset=\"utf-8\">\n<style type=\"text/css\"> body { margin: 40px auto; max-width: 650px; line-height: 1.6; font-size: 18px; color: #444; padding: 0 10px } h1,h2,h3 { line-height: 1.2 } </style>\n</head>\n<body>\n</body>\n</html>" > $@

standard_02:
	@echo "<html>\n<head>\n<meta charset=\"utf-8\">\n<style type=\"text/css\"> body { margin: 40px auto; max-width: 650px; line-height: 1.6; font-size: 18px; color: #444; padding: 0 10px } h1,h2,h3 { line-height: 1.2 } </style>\n</head>\n<body>\n<p>Pellentesque dapibus suscipit ligula. Donec posuere augue in quam. Etiam vel tortor sodales tellus ultricies commodo. Suspendisse potenti. Aenean in sem ac leo mollis blandit. Donec neque quam, dignissim in, mollis nec, sagittis eu, wisi. Phasellus lacus. Etiam laoreet quam sed arcu. Phasellus at dui in ligula mollis ultricies. Integer placerat tristique nisl. Praesent augue. Fusce commodo. Vestibulum convallis, lorem a tempus semper, dui dui euismod elit, vitae placerat urna tortor vitae lacus. Nullam libero mauris, consequat quis, varius et, dictum id, arcu. Mauris mollis tincidunt felis. Aliquam feugiat tellus ut neque. Nulla facilisis, risus a rhoncus fermentum, tellus tellus lacinia purus, et dictum nunc justo sit amet elit.</p>\n</body>\n</html>" > $@

standard_03:
	@echo "<html>\n<head>\n<meta charset=\"utf-8\">\n<style type=\"text/css\"> body { margin: 40px auto; max-width: 650px; line-height: 1.6; font-size: 18px; color: #444; padding: 0 10px } h1,h2,h3 { line-height: 1.2 } </style>\n</head>\n<body>\n<p>Pellentesque dapibus suscipit ligula. Donec posuere augue in quam. Etiam vel tortor sodales tellus ultricies commodo. Suspendisse potenti. Aenean in sem ac leo mollis blandit. Donec neque quam, dignissim in, mollis nec, sagittis eu, wisi. Phasellus lacus. Etiam laoreet quam sed arcu. Phasellus at dui in ligula mollis ultricies. Integer placerat tristique nisl. Praesent augue. Fusce commodo. Vestibulum convallis, lorem a tempus semper, dui dui euismod elit, vitae placerat urna tortor vitae lacus. Nullam libero mauris, consequat quis, varius et, dictum id, arcu. Mauris mollis tincidunt felis. Aliquam feugiat tellus ut neque. Nulla facilisis, risus a rhoncus fermentum, tellus tellus lacinia purus, et dictum nunc justo sit amet elit.</p>\n<p>Cras placerat accumsan nulla. </p>\n</body>\n</html>" > $@

standard_04:
	@echo "<html>\n<head>\n<meta charset=\"utf-8\">\n<style type=\"text/css\"> body { margin: 40px auto; max-width: 650px; line-height: 1.6; font-size: 18px; color: #444; padding: 0 10px } h1,h2,h3 { line-height: 1.2 } </style>\n</head>\n<body>\n<p>Donec vitae dolor.</p>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>\n</body>\n</html>" > $@

standard_05:
	@echo "<html>\n<head>\n<meta charset=\"utf-8\">\n<style type=\"text/css\"> body { margin: 40px auto; max-width: 650px; line-height: 1.6; font-size: 18px; color: #444; padding: 0 10px } h1,h2,h3 { line-height: 1.2 } </style>\n</head>\n<body>\n<p>&lt;&gt;&amp;&quot;&#39;</p>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>\n</body>\n</html>" > $@

standard_06:
	@echo "<html>\n<head>\n<meta charset=\"utf-8\">\n<style type=\"text/css\"> body { margin: 40px auto; max-width: 650px; line-height: 1.6; font-size: 18px; color: #444; padding: 0 10px } p { line-height: 1.2 } </style>\n</head>\n<body>\n</body>\n</html>" > $@

standard_07:
	@echo "<html>\n<head>\n<meta charset=\"utf-8\">\n<style type=\"text/css\"> body { margin: 40px auto; max-width: 650px; line-height: 1.6; font-size: 18px; color: #444; padding: 0 10px } h1,h2,h3 { line-height: 1.2 } </style>\n</head>\n<body>\n<p><>&\"'</p>\n</body>\n</html>" > $@

result_01: test_01
	@./mk-nice < $? > $@

result_02: test_02
	@./mk-nice < $? > $@

result_03: test_03
	@./mk-nice < $? > $@

result_04: test_04
	@./mk-nice < $? > $@

result_05: test_05
	@./mk-nice < $? > $@

result_06: test_06
	@./mk-nice -s "body { margin: 40px auto; max-width: 650px; line-height: 1.6; font-size: 18px; color: #444; padding: 0 10px } p { line-height: 1.2 }"< $? > $@

result_07: test_07
	@./mk-nice < $? > $@

# empty file
test_01:
	@echo "" > $@

# one arbitrary length paragraph
test_02:
	@echo "Pellentesque dapibus suscipit ligula. Donec posuere augue in quam. Etiam vel tortor sodales tellus ultricies commodo. Suspendisse potenti. Aenean in sem ac leo mollis blandit. Donec neque quam, dignissim in, mollis nec, sagittis eu, wisi. Phasellus lacus. Etiam laoreet quam sed arcu. Phasellus at dui in ligula mollis ultricies. Integer placerat tristique nisl. Praesent augue. Fusce commodo. Vestibulum convallis, lorem a tempus semper, dui dui euismod elit, vitae placerat urna tortor vitae lacus. Nullam libero mauris, consequat quis, varius et, dictum id, arcu. Mauris mollis tincidunt felis. Aliquam feugiat tellus ut neque. Nulla facilisis, risus a rhoncus fermentum, tellus tellus lacinia purus, et dictum nunc justo sit amet elit." > $@

# two paragraphs
test_03:
	@echo "Pellentesque dapibus suscipit ligula. Donec posuere augue in quam. Etiam vel tortor sodales tellus ultricies commodo. Suspendisse potenti. Aenean in sem ac leo mollis blandit. Donec neque quam, dignissim in, mollis nec, sagittis eu, wisi. Phasellus lacus. Etiam laoreet quam sed arcu. Phasellus at dui in ligula mollis ultricies. Integer placerat tristique nisl. Praesent augue. Fusce commodo. Vestibulum convallis, lorem a tempus semper, dui dui euismod elit, vitae placerat urna tortor vitae lacus. Nullam libero mauris, consequat quis, varius et, dictum id, arcu. Mauris mollis tincidunt felis. Aliquam feugiat tellus ut neque. Nulla facilisis, risus a rhoncus fermentum, tellus tellus lacinia purus, et dictum nunc justo sit amet elit.\nCras placerat accumsan nulla. " > $@

# two paragraphs with double newline
test_04:
	@echo "Donec vitae dolor.\n\nLorem ipsum dolor sit amet, consectetuer adipiscing elit.\n" > $@

# HTML escape characters
test_05:
	@echo "<>&\"'\nLorem ipsum dolor sit amet, consectetuer adipiscing elit.\n" > $@

# custom css
test_06:
	@echo "" > $@

test_07:
	@echo "\\<\\>\\&\\\"\\'" > $@

clean:
	rm mk-nice $(wildcard test_*) $(wildcard result_*) $(wildcard standard_*)
