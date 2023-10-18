#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <cargs.h>
#include "mk-nice.h"

#define BUFF_SIZE 128

int main(int argc, char *argv[]) {
  char identifier;
  const char *style_value;
  struct program_config config = {"body { margin: 40px auto; max-width: 650px; line-height: 1.6; font-size: 18px; color: #444; padding: 0 10px } h1,h2,h3 { line-height: 1.2 }"};
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

  printf("<html>\n<head>\n<meta charset=\"utf-8\">\n<style type=\"text/css\"> %s </style>\n</head>\n<body>\n", config.style);
  while ((res = getaline(&one_line, &buffer_size)) > 0) {
    if (!one_line) return -1;
    if (strlen(one_line) != 0) printf("<p>%s</p>\n", one_line);
  }
  printf("</body>\n</html>\n");

  free(one_line);

  return 0;
}

int getaline(char** buffer, unsigned int* buff_size) {
  char temp_buffer[7]; // in case you need to load escape character
  int which_escape_char = 0;
  unsigned int i = 0;
  char c;

  while (c = getchar(), c != EOF && c != '\n') {
    which_escape_char = choose_char(c);
    if (which_escape_char < 5) {
      strcpy(temp_buffer, escape_char[which_escape_char]);
      temp_buffer[6] = '\0';
    }
    else {
      temp_buffer[0] = c;
      temp_buffer[1] = '\0';
    }
    for (int x = 0; x < strlen(temp_buffer); x++) {
      (*buffer)[i++] = temp_buffer[x];
      if (i >= *(buff_size)) {
        *buffer = realloc(*buffer, (*buff_size) *= 2);
        if (!(*buffer)) return -1;
      }
    }
  }
  (*buffer)[i] = '\0';
  if (c == EOF) return 0;
  if (c == '\n') return 1;
  return -1;
}

int choose_char(char c) {
  switch(c) {
    case '>': return GREATER;
    case '<': return LOWER;
    case '&': return AMPERSAND;
    case '\"': return QUOTE;
    case '\'': return SIN_QUOTE;
  }
  return DEFAULT;
}
