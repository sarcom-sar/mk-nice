#include <stdio.h>
#include <stdlib.h>
#include <cargs.h>

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
  struct program_config config = {NULL};
  cag_option_context context;

  int c;

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

  while ((c = getchar()) != EOF) {
    putchar(c);
  }

  return 0;
}
