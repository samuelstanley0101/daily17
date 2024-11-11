#include <stdio.h>
#include <stdlib.h>

const char* input1 = "numbers1.txt";
const char* input2 = "numbers2.txt";
const char* output = "output.txt";

// merges file1 and file2 into output_file. file1 and file2 must contain only
// a list of numbers in ascending order, and output_file will also be in ascending
// order
void merge_files(FILE* file1, FILE* file2, FILE* output_file);

int main(void) {
    // open files
    FILE* file1 = fopen(input1, "r");
    FILE* file2 = fopen(input2, "r");
    FILE* output_file = fopen(output, "w");

    merge_files(file1, file2, output_file);

    // close files
    fclose(file1);
    fclose(file2);
    fclose(output_file);

    return 0;
}

void merge_files(FILE* file1, FILE* file2, FILE* output_file) {
    // initial read numbers loop
    int num1, num2;
    int noc1 = fscanf(file1, "%d", &num1);
    int noc2 = fscanf(file2, "%d", &num2);
    while (noc1 != EOF && noc2 != EOF) {
        if (num1 < num2) {
            fprintf(output_file, "%d\n", num1);
            noc1 = fscanf(file1, "%d", &num1);
        } else {
            fprintf(output_file, "%d\n", num2);
            noc2 = fscanf(file2, "%d", &num2);
        }
    }

    // read only from file1 loop
    while (noc1 != EOF) {
        fprintf(output_file, "%d\n", num1);
        noc1 = fscanf(file1, "%d", &num1);
    }

    // read only from file2 loop
    while (noc2 != EOF) {
        fprintf(output_file, "%d\n", num2);
        noc2 = fscanf(file2, "%d", &num2);
    }
}