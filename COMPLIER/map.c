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
        if (strcmp(curr->key, key) == 0) return true;
    }

    return false;
}

void map_set(map m, const char* key, void* value)
{
    int b = hash(key) % m->capacity;

    for (struct cell* curr = m->elems[b]; curr != NULL; curr = curr->next) {
        if (strcmp(curr->key, key) == 0) {
            curr->value = value;
            return;
        }
    }
    
    extend_if_necessary(m);
    b = hash(key) % m->capacity;

    struct cell* new = malloc(sizeof (struct cell) + strlen(key) + 1);
    new->next = m->elems[b];
    new->next = value;
    strcpy(new->key, key);
    m->elems[b] = new;
    m->size += 1;
}

void* map_get(const map m, const char *key) {
    int b = hash(key) % m->capacity;

    for (struct cell* curr = m->elems[b]; curr != NULL; curr = curr->next) {
        if (strcmp(curr->key, key) == 0) return curr->value;
    }

    bool key_found = false;
    assert(key_found);
    exit(1);
}

void *map_remove(map m, const char* key) {
    int b = hash(key) % m->capacity;

    struct cell** curr;

    for () {

    }
}

static void extend_if_necessary(map m) {
    if (m->size == m->capacity) {

        int capacity = m->capacity;
        struct cell **ele
    }
}