#ifndef BST_HPP
#define BST_HPP

using namespace std;

// Struct for a tree node
struct Node{
    int key; // data to be stored in the node
    Node* left = nullptr; // pointer to the leftchild node
    Node* right = nullptr; // pointer to the rightchild node
    // feel free to make a parent pointer
};

class BST{
    private:
        Node* createNode(int data);
        Node* root = nullptr;

        Node* addNodeHelper(Node* currNode, int data);
        Node* deleteNodeHelper(Node *currNode, int value);
        int searchKeyHelper(Node* currNode, int data);
        void printTreeHelper(Node* currNode);
        void print2DUtilHelper(Node *currNode, int space);
        void destroyNode(Node *currNode);

    public:
        void addNode(int);
        void deleteNode(int);
        bool searchKey(int);
        void printTree();
        BST();
        BST(int data);
        ~BST();
        void print2DUtil(int space);
        int sumRange(int min, int max);

};
#endif
