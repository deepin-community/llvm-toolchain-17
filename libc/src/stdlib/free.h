//===-- Implementation header for free --------------------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include <stdlib.h>

#ifndef LLVM_LIBC_SRC_STDLIB_FREE_H
#define LLVM_LIBC_SRC_STDLIB_FREE_H

namespace __llvm_libc {

void free(void *ptr);

} // namespace __llvm_libc

#endif // LLVM_LIBC_SRC_STDLIB_LDIV_H