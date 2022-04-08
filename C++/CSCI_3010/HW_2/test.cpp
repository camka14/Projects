#define CATCH_CONFIG_MAIN  // This tells Catch to provide a main() - only do this in one cpp file
#include "catch.hpp"

#include "Counter.hpp"

TEST_CASE("Counter default constructor") {
    Counter<int> c;
    REQUIRE(c.Count() == 0);
}

TEST_CASE("Counter's std::vector constructor") {
    Counter<int> c1(std::vector<int> {1, 2, 3});
    REQUIRE(c1.Count() == 3);
    Counter<int> c2(std::vector<int> {1, 1, 3});
    REQUIRE(c2.Count() == 3);
}

TEST_CASE("Counter's  key counter") {
    Counter<int> c1(std::vector<int> {1, 2, 3});
    REQUIRE(c1.Count(1) == 1);
    REQUIRE(c1.Count(0) == 0);
}

TEST_CASE("Counter's  min, max counter") {
    Counter<int> c1(std::vector<int> {1, 2, 3, 9, 6, 9, 5});
    REQUIRE(c1.Count(3,10) == 5);
    Counter<int> c2(std::vector<int> {1, 1, 3});
    REQUIRE(c2.Count() == 3);
    Counter<char> c3(std::vector<char> {'a', 'b', 'c', 'i', 'f', 'i', 'e'});
    REQUIRE(c3.Count('c','j') == 5);
}

TEST_CASE("Counter's  most common function") {
    Counter<int> c1(std::vector<int> {1, 2, 3, 9, 6, 9, 5});
    REQUIRE(c1.MostCommon() == 9);
}

TEST_CASE("Counter's  most common with top n") {
    Counter<int> c1(std::vector<int> {1, 2, 3, 9, 6, 9, 6});
    std::vector<int> out = {6,9,3};
    REQUIRE(c1.MostCommon(3) == out);
    
    Counter<std::string> c2(std::vector<std::string> {"cat", "dog","kangaroo","salamander"});
    c2.Increment("cat",2);
    c2.Increment("dog",2);
    c2.Increment("kangaroo",3);
    std::vector<std::string> v = {"cat","dog","kangaroo"};
    
    REQUIRE(c2.MostCommon(3) == v);
}

TEST_CASE("Counter's  least common function") {
    Counter<int> c1(std::vector<int> {1, 2, 3, 9, 6, 9, 5});
    REQUIRE(c1.LeastCommon() == 1);
}

TEST_CASE("Counter's  least common with top n") {
    Counter<int> c1(std::vector<int> {1, 2, 3, 9, 6, 9, 6});
    std::vector<int> out = {1,2,3};
    REQUIRE(c1.LeastCommon(3) == out);
    
    Counter<std::string> c2(std::vector<std::string> {"cat","cat", "dog","kangaroo","kangaroo","kangaroo","salamander","dog"});
    std::vector<std::string> v = {"cat","dog","salamander"};
    
    REQUIRE(c2.LeastCommon(3) == v);
}

TEST_CASE("Counter's  normalize") {
    Counter<std::string> c1(std::vector<std::string> {"cat", "dog", "hamster","eagle"});
    c1.Increment("cat", 7);
    c1.Increment("dog", 3);
    c1.Increment("hamster", 1);
    c1.Increment("eagle", 5);
    std::map<std::string,double> m = {{"cat", 0.4}, {"dog", 0.2}, {"hamster", 0.1}, {"eagle", 0.3} };
    REQUIRE(c1.Normalized() == m);
}

TEST_CASE("Counter's  return keys") {
    Counter<std::string> c1(std::vector<std::string> {"cat", "dog", "hamster","eagle"});
    c1.Increment("cat", 7);
    c1.Increment("dog", 3);
    c1.Increment("hamster", 1);
    c1.Increment("eagle", 5);
    std::set<std::string> s = {"cat", "dog", "hamster","eagle"};
    REQUIRE(c1.Keys() == s);
}

TEST_CASE("Counter's  return values") {
    Counter<std::string> c1(std::vector<std::string> {"cat", "dog", "hamster","eagle"});
    c1.Increment("cat", 7);
    c1.Increment("dog", 3);
    c1.Increment("hamster", 1);
    c1.Increment("eagle", 5);
    std::vector<int> v = {8, 4, 6, 2};
    REQUIRE(c1.Values() == v);
}