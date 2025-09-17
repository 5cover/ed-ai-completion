#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define CACHE_CAPACITY 4
#define HASH_SIZE 8

typedef struct Node {
    int key;
    int value;
    struct Node* prev;
    struct Node* next;
} Node;

typedef struct {
    Node* head;
    Node* tail;
    Node* hashmap[HASH_SIZE];
} LRUCache;

unsigned int hash(int key) {
    return (unsigned int)key % HASH_SIZE;
}

Node* create_node(int key, int value) {
    Node* node = (Node*)malloc(sizeof(Node));
    if (!node) exit(1);
    node->key = key;
    node->value = value;
    node->prev = NULL;
    node->next = NULL;
    return node;
}

void move_to_front(LRUCache* cache, Node* node) {
    if (cache->head == node) return;

    // Detach node
    if (node->prev) node->prev->next = node->next;
    if (node->next) node->next->prev = node->prev;
    if (cache->tail == node) cache->tail = node->prev;

    // Move to front
    node->prev = NULL;
    node->next = cache->head;
    if (cache->head) cache->head->prev = node;
    cache->head = node;

    if (!cache->tail) cache->tail = node;
}

void remove_tail(LRUCache* cache) {
    if (!cache->tail) return;

    Node* tail = cache->tail;
    unsigned int index = hash(tail->key);
    while (cache->hashmap[index] && cache->hashmap[index]->key != tail->key) {
        index = (index + 1) % HASH_SIZE;
    }
    if (cache->hashmap[index]) {
        cache->hashmap[index] = NULL;
    }

    cache->tail = tail->prev;
    if (cache->tail) cache->tail->next = NULL;
    if (tail == cache->head) cache->head = NULL;
    free(tail);
}

void put(LRUCache* cache, int key, int value) {
    unsigned int index = hash(key);
    while (cache->hashmap[index] && cache->hashmap[index]->key != key) {
        index = (index + 1) % HASH_SIZE;
    }

    if (cache->hashmap[index]) {
        cache->hashmap[index]->value = value;
        move_to_front(cache, cache->hashmap[index]);
        return;
    }

    Node* node = create_node(key, value);
    cache->hashmap[index] = node;
    move_to_front(cache, node);

    int count = 0;
    Node* cur = cache->head;
    while (cur) {
        count++;
        cur = cur->next;
    }

    if (count > CACHE_CAPACITY) {
        remove_tail(cache);
    }
}

int get(LRUCache* cache, int key) {
    unsigned int index = hash(key);
    while (cache->hashmap[index]) {
        if (cache->hashmap[index]->key == key) {
            move_to_front(cache, cache->hashmap[index]);
            return cache->hashmap[index]->value;
        }
        index = (index + 1) % HASH_SIZE;
    }
    return -1;
}

LRUCache* create_cache() {
    LRUCache* cache = (LRUCache*)malloc(sizeof(LRUCache));
    if (!cache) exit(1);
    cache->head = NULL;
    cache->tail = NULL;
    memset(cache->hashmap, 0, sizeof(cache->hashmap));
    return cache;
}

void free_cache(LRUCache* cache) {
    Node* cur = cache->head;
    while (cur) {
        Node* next = cur->next;
        free(cur);
        cur = next;
    }
    free(cache);
}

void print_cache(LRUCache* cache) {
    Node* cur = cache->head;
    printf("Cache state (MRU to LRU): ");
    while (cur) {
        printf("(%d:%d) ", cur->key, cur->value);
        cur = cur->next;
    }
    printf("\n");
}

int main() {
    LRUCache* cache = create_cache();

    put(cache, 1, 10);
    put(cache, 2, 20);
    put(cache, 3, 30);
    put(cache, 4, 40);
    print_cache(cache);

    get(cache, 2);
    print_cache(cache);

    put(cache, 5, 50); // evicts key 1
    print_cache(cache);

    printf("Get key 3: %d\n", get(cache, 3));
    print_cache(cache);

    free_cache(cache);
    return 0;
}
