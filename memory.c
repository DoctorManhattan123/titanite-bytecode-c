#include <stdlib.h>
#include <stdio.h>

#include "memory.h"

void *reallocate(void *pointer, size_t oldSize, size_t newSize)
{
    if (newSize == 0)
    {
        free(pointer);
        return NULL;
    }

    // we do not need malloc, because if realloc does the same as malloc if the given pointer is NULL
    void *result = realloc(pointer, newSize);
    // if realloc returns NULL, there is no memory left
    if (result == NULL) {
        fprintf(stderr, "There is no more memory left.");
        exit(1);
    }
    return result;
}