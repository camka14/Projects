#ifndef TREE_H
#define TREE_H

class Tree {
    public:

        virtual void Seed() { number_seeds_ += 1; };

        int get_number_seeds() { return number_seeds_; }

    private:
        static int number_seeds_;
};

class Pine : public Tree{
public:
    void Seed() { Tree::Seed(); Tree::Seed(); };
};

#endif // TREE_H
