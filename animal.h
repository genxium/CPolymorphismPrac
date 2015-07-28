#ifndef ANIMAL_H_
#define ANIMAL_H_

typedef const char* (*f1)(void);

struct animal
{
    // make vtable_ a pointer so they can be shared between instances
    // use _ to mark private members
    const struct animal_vtable_ *vtable_;
    const char *name;
};

struct animal_vtable_
{
    f1 sound;
};

// wrapper function
static inline const char *animal_sound(struct animal *animal)
{
    return animal->vtable_->sound();
}

// make the vtables arrays so they can be used as pointers
extern const struct animal_vtable_ CAT[], DOG[];

#endif
