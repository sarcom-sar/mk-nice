#ifndef MK_NICE
#define MK_NICE

char escape_char[][6] = {"&gt;", "&lt;", "&amp;", "&quot;", "&#39;"};
enum escape_num { GREATER, LOWER, AMPERSAND, QUOTE, SIN_QUOTE, DEFAULT};

static struct cag_option options[] = {
  {.identifier = 'h',
   .access_letters = "h",
   .access_name = "help",
   .description = "Shows commands\' help"},

  {.identifier = 's',
   .access_letters = "s",
   .access_name = "style",
   .value_name = "STYLE",
   .description = "Inject custom css in place of default"}
};

struct program_config {
  const char *style;
};

int getaline(char** buffer, unsigned int* buff_size);
int choose_char(char c);
#endif
