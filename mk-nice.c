#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <cargs.h>

#define BUFF_SIZE 128

int getaline(char** buffer, unsigned int* buff_size);

static struct cag_option options[] = {
  {.identifier = 'h',
   .access_letters = "h",
   .access_name = "help",
   .description = "Shows commands\' help"},

  {.identifier = 's',
   .access_letters = "s",
   .access_name = "style",
   .description = "Inject custom css in place of default"}
};

struct program_config {
  const char *style;
};

int main(int argc, char *argv[]) {
  char identifier;
  const char *style_value;
  struct program_config config = {"<style type=\"text/css\"> body { margin: 40px auto; max-width: 650px; line-height: 1.6; font-size: 18px; color: #444; padding: 0 10px } h1,h2,h3 { line-height: 1.2 } </style>"};
  cag_option_context context;

  cag_option_prepare(&context, options, CAG_ARRAY_SIZE(options), argc, argv);
  while (cag_option_fetch(&context)) {
    identifier = cag_option_get(&context);
    switch (identifier) {
      case 'h':
        printf("Syntax: mk-nice [OPTION]... FILE\n");
        printf("Formats FILE into bettermotherfuckingwebsite style html\n");
        cag_option_print(options, CAG_ARRAY_SIZE(options), stdout);
        return 0;
      case 's':
        style_value = cag_option_get_value(&context);
        config.style = style_value;
        break;
    }
  }

  // preparation for data from stdin
  // includes <style> css
  unsigned int res = 0;
  unsigned int buffer_size = 8;
  char* one_line = (char*)malloc(buffer_size);

  printf("<html>\n<head>\n%s\n</head>\n<body>\n", config.style);
  while ((res = getaline(&one_line, &buffer_size)) > 0) {
    if (!one_line) return -1;
    if (strlen(one_line) != 0) printf("<p>%s</p>\n", one_line);
  }
  printf("</body>\n</html>\n");

  return 0;
}

int getaline(char** buffer, unsigned int* buff_size) {
  unsigned int i = 0;
  char c;
  while (c = getchar(), c != EOF && c != '\n') {
    (*buffer)[i++] = c;
    if (i >= (*buff_size)) {
      *buffer = realloc(*buffer, (*buff_size) *= 2);
      if (!(*buffer)) return -1;
    }
  }
  (*buffer)[i] = '\0';
  if (c == EOF) return 0;
  if (c == '\n') return 1;
  return -1;
}
