; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i386-apple-darwin -relocation-model=pic | FileCheck %s

@main_q = internal global ptr null		; <ptr> [#uses=1]

define void @func2() nounwind {
; CHECK-LABEL: func2:
; CHECK:       ## %bb.0: ## %entry
; CHECK-NEXT:    calll L0$pb
; CHECK-NEXT:  L0$pb:
; CHECK-NEXT:    popl %eax
; CHECK-NEXT:    leal _main_q-L0$pb(%eax), %eax
; CHECK-NEXT:    ## InlineAsm Start
; CHECK-NEXT:    movl %eax, %gs:152
; CHECK-NEXT:    ## InlineAsm End
; CHECK-NEXT:    retl
entry:
	tail call void asm "mov $1,%gs:$0", "=*m,ri,~{dirflag},~{fpsr},~{flags}"(ptr elementtype(ptr) inttoptr (i32 152 to ptr), ptr @main_q) nounwind
	ret void
}

; The intent of this test is to ensure that we handle blockaddress' correctly
; with "i" constraints for -m32 -fPIC.

define void @x() {
; CHECK-LABEL: x:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    ## InlineAsm Start
; CHECK-NEXT:    ## LBB1_1
; CHECK-EMPTY:
; CHECK-NEXT:    ## InlineAsm End
; CHECK-NEXT:  ## %bb.2: ## %return
; CHECK-NEXT:    retl
; CHECK-NEXT:  Ltmp0: ## Block address taken
; CHECK-NEXT:  LBB1_1: ## %overflow
; CHECK-NEXT:    ## Label of block must be emitted
; CHECK-NEXT:    retl
  callbr void asm "#  ${0:l}\0A", "!i"()
          to label %return [label %overflow]

overflow:
  br label %return

return:
  ret void
}

; Test unusual case of blockaddress from @x in @y's asm.
define void @y() {
; CHECK-LABEL: y:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    ## InlineAsm Start
; CHECK-NEXT:    ## Ltmp0
; CHECK-EMPTY:
; CHECK-NEXT:    ## InlineAsm End
; CHECK-NEXT:    retl
  call void asm "# ${0:l}\0A", "i"(ptr blockaddress(@x, %overflow))
  ret void
}