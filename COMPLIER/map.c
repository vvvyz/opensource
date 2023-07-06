#include "map.h"
#include <stdlib.h>
#include <string.h>
#include <assert.h>

struct cell {
    struct cell* next;
    void* value;
    char key[];
}cell;

struct map {
    struct cell **elems;
    int capacity;
    int size;
};

static unsigned int hash(const char* key);
static void extend_if_necessary(map m);

map map_create() {
    map m = malloc(sizeof (map));
    assert(m != NULL);

    m->elems = calloc(1, sizeof (struct cell *))
    assert(m->elems != NULL);

    m->capacity = 1;
    m->size = 0;

    return m;
}

void map_destory(map m) {
    for (int i = 0; i < m->capacity; i ++) {
        struct cell* curr = m->elems[i];

        while (curr != NULL) {
            struct cell *next = curr->next;
            free(curr);
            curr = next;
        }
    }

    free(m->elems);
    free(m);
}

int map_size(const map m) {
    return m->size;
}

//hash映射
bool map_contains(const map m, ) {
    int b = hash(key) % m->capacity;

    for (struct cell* curr = m->elems[b]; curr != NULL; curr = curr->next) {
        
    }
}