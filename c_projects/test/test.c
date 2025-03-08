#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <stdbool.h>

bool input(char string[]) {
    scanf("%s", string);
    int length = strlen(string);
    if (length > 9) {
        printf("Moc velké číslo!\nJsi kokot!\n");
        return false;
    }
    bool success = true;
    for (int i = 0; i < length; i++) {
        if (!isdigit(string[i])) {
            printf("Jsi kokot!\n");
            success = false;
            break;
        }
    }
    return success;
}

int main() {
    char string[10] = "";
    char string_2[10] = "";
    unsigned long int rohliky;
    unsigned long int penize;

start:
    printf("Počet rohlíků? ");
    if (!input(string)) goto start;
    rohliky = atol(string);

middle:
    printf("Kolik zaplatíš? ");
    if (!input(string_2)) goto middle;
    penize = atol(string_2);

end:
    if (penize < rohliky * 3) {
        char string_3[2] = "";
        printf("To nestačí, zaplať víc! Z = Znovu, C = Změnit cenu, E = Exit: ");
        scanf("%s", string_3);
        if (strlen(string_3) > 1) {
            printf("Jsi kokot!\n");
            goto end;
        }
        char ch_input = toupper(string_3[0]);
        if (ch_input == 90)
            goto start;
        if (ch_input == 67)
            goto middle;
        if (ch_input == 69)
            exit(0);
        printf("Jsi kokot!\n");
        goto end;
    }
    printf("%d\n", rohliky);
    return 0;
}
