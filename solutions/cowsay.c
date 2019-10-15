#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char *template =
    " %s \n"
    "< %s >\n"
    " %s\n"
    "        \\   ^__^\n"
    "         \\  (oo)\\_______\n"
    "            (__)\\       )\\/\\\n"
    "                ||----w |\n"
    "                ||     ||\n";

char *border(char *text, char borderChar) {
    int length = strlen(text) + 2;
    char *buffer = malloc(length + 1);
    memset(buffer, borderChar, length);
    buffer[length] = '\0';
    return buffer;
}

int main(int argc, char *argv[]) {
    if (argc == 2) {
        char *text = argv[1];
        printf(template, border(text, '_'), text, border(text, '-'));
    } else {
        printf("Usage: cowsay [message]\n");
    }
    return 0;
}
