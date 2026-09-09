#include "foo.h"
#include <iostream>

auto main(int argc, char **argv) -> int {
  std::cout << "add(1, 2) = " << add(1, 2) << '\n';
  return 0;
}
