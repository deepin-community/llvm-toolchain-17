; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx512bw,+avx512vl | FileCheck %s --check-prefix=AVX512BWVL
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx512bw | FileCheck %s --check-prefix=AVX512BW

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm_test_epi8_mask(<2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; AVX512BWVL-LABEL: TEST_mm_test_epi8_mask:
; AVX512BWVL:       # %bb.0: # %entry
; AVX512BWVL-NEXT:    vptestmb %xmm0, %xmm1, %k0
; AVX512BWVL-NEXT:    kmovd %k0, %eax
; AVX512BWVL-NEXT:    # kill: def $ax killed $ax killed $eax
; AVX512BWVL-NEXT:    retq
;
; AVX512BW-LABEL: TEST_mm_test_epi8_mask:
; AVX512BW:       # %bb.0: # %entry
; AVX512BW-NEXT:    # kill: def $xmm1 killed $xmm1 def $zmm1
; AVX512BW-NEXT:    # kill: def $xmm0 killed $xmm0 def $zmm0
; AVX512BW-NEXT:    vptestmb %zmm0, %zmm1, %k0
; AVX512BW-NEXT:    kmovd %k0, %eax
; AVX512BW-NEXT:    # kill: def $ax killed $ax killed $eax
; AVX512BW-NEXT:    vzeroupper
; AVX512BW-NEXT:    retq
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <16 x i8>
  %1 = icmp ne <16 x i8> %0, zeroinitializer
  %2 = bitcast <16 x i1> %1 to i16
  ret i16 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm_mask_test_epi8_mask(i16 zeroext %__U, <2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; AVX512BWVL-LABEL: TEST_mm_mask_test_epi8_mask:
; AVX512BWVL:       # %bb.0: # %entry
; AVX512BWVL-NEXT:    vptestmb %xmm0, %xmm1, %k0
; AVX512BWVL-NEXT:    kmovd %k0, %eax
; AVX512BWVL-NEXT:    andl %edi, %eax
; AVX512BWVL-NEXT:    # kill: def $ax killed $ax killed $eax
; AVX512BWVL-NEXT:    retq
;
; AVX512BW-LABEL: TEST_mm_mask_test_epi8_mask:
; AVX512BW:       # %bb.0: # %entry
; AVX512BW-NEXT:    # kill: def $xmm1 killed $xmm1 def $zmm1
; AVX512BW-NEXT:    # kill: def $xmm0 killed $xmm0 def $zmm0
; AVX512BW-NEXT:    vptestmb %zmm0, %zmm1, %k0
; AVX512BW-NEXT:    kmovd %k0, %eax
; AVX512BW-NEXT:    andl %edi, %eax
; AVX512BW-NEXT:    # kill: def $ax killed $ax killed $eax
; AVX512BW-NEXT:    vzeroupper
; AVX512BW-NEXT:    retq
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <16 x i8>
  %1 = icmp ne <16 x i8> %0, zeroinitializer
  %2 = bitcast i16 %__U to <16 x i1>
  %3 = and <16 x i1> %1, %2
  %4 = bitcast <16 x i1> %3 to i16
  ret i16 %4
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm_test_epi16_mask(<2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; AVX512BWVL-LABEL: TEST_mm_test_epi16_mask:
; AVX512BWVL:       # %bb.0: # %entry
; AVX512BWVL-NEXT:    vptestmw %xmm0, %xmm1, %k0
; AVX512BWVL-NEXT:    kmovd %k0, %eax
; AVX512BWVL-NEXT:    # kill: def $al killed $al killed $eax
; AVX512BWVL-NEXT:    retq
;
; AVX512BW-LABEL: TEST_mm_test_epi16_mask:
; AVX512BW:       # %bb.0: # %entry
; AVX512BW-NEXT:    # kill: def $xmm1 killed $xmm1 def $zmm1
; AVX512BW-NEXT:    # kill: def $xmm0 killed $xmm0 def $zmm0
; AVX512BW-NEXT:    vptestmw %zmm0, %zmm1, %k0
; AVX512BW-NEXT:    kmovd %k0, %eax
; AVX512BW-NEXT:    # kill: def $al killed $al killed $eax
; AVX512BW-NEXT:    vzeroupper
; AVX512BW-NEXT:    retq
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <8 x i16>
  %1 = icmp ne <8 x i16> %0, zeroinitializer
  %2 = bitcast <8 x i1> %1 to i8
  ret i8 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm_mask_test_epi16_mask(i8 zeroext %__U, <2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; AVX512BWVL-LABEL: TEST_mm_mask_test_epi16_mask:
; AVX512BWVL:       # %bb.0: # %entry
; AVX512BWVL-NEXT:    vptestmw %xmm0, %xmm1, %k0
; AVX512BWVL-NEXT:    kmovd %k0, %eax
; AVX512BWVL-NEXT:    andb %dil, %al
; AVX512BWVL-NEXT:    # kill: def $al killed $al killed $eax
; AVX512BWVL-NEXT:    retq
;
; AVX512BW-LABEL: TEST_mm_mask_test_epi16_mask:
; AVX512BW:       # %bb.0: # %entry
; AVX512BW-NEXT:    # kill: def $xmm1 killed $xmm1 def $zmm1
; AVX512BW-NEXT:    # kill: def $xmm0 killed $xmm0 def $zmm0
; AVX512BW-NEXT:    vptestmw %zmm0, %zmm1, %k0
; AVX512BW-NEXT:    kmovd %k0, %eax
; AVX512BW-NEXT:    andb %dil, %al
; AVX512BW-NEXT:    # kill: def $al killed $al killed $eax
; AVX512BW-NEXT:    vzeroupper
; AVX512BW-NEXT:    retq
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <8 x i16>
  %1 = icmp ne <8 x i16> %0, zeroinitializer
  %2 = bitcast i8 %__U to <8 x i1>
  %3 = and <8 x i1> %1, %2
  %4 = bitcast <8 x i1> %3 to i8
  ret i8 %4
}

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm_testn_epi8_mask(<2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; AVX512BWVL-LABEL: TEST_mm_testn_epi8_mask:
; AVX512BWVL:       # %bb.0: # %entry
; AVX512BWVL-NEXT:    vptestnmb %xmm0, %xmm1, %k0
; AVX512BWVL-NEXT:    kmovd %k0, %eax
; AVX512BWVL-NEXT:    # kill: def $ax killed $ax killed $eax
; AVX512BWVL-NEXT:    retq
;
; AVX512BW-LABEL: TEST_mm_testn_epi8_mask:
; AVX512BW:       # %bb.0: # %entry
; AVX512BW-NEXT:    # kill: def $xmm1 killed $xmm1 def $zmm1
; AVX512BW-NEXT:    # kill: def $xmm0 killed $xmm0 def $zmm0
; AVX512BW-NEXT:    vptestnmb %zmm0, %zmm1, %k0
; AVX512BW-NEXT:    kmovd %k0, %eax
; AVX512BW-NEXT:    # kill: def $ax killed $ax killed $eax
; AVX512BW-NEXT:    vzeroupper
; AVX512BW-NEXT:    retq
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <16 x i8>
  %1 = icmp eq <16 x i8> %0, zeroinitializer
  %2 = bitcast <16 x i1> %1 to i16
  ret i16 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm_mask_testn_epi8_mask(i16 zeroext %__U, <2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; AVX512BWVL-LABEL: TEST_mm_mask_testn_epi8_mask:
; AVX512BWVL:       # %bb.0: # %entry
; AVX512BWVL-NEXT:    vptestnmb %xmm0, %xmm1, %k0
; AVX512BWVL-NEXT:    kmovd %k0, %eax
; AVX512BWVL-NEXT:    andl %edi, %eax
; AVX512BWVL-NEXT:    # kill: def $ax killed $ax killed $eax
; AVX512BWVL-NEXT:    retq
;
; AVX512BW-LABEL: TEST_mm_mask_testn_epi8_mask:
; AVX512BW:       # %bb.0: # %entry
; AVX512BW-NEXT:    # kill: def $xmm1 killed $xmm1 def $zmm1
; AVX512BW-NEXT:    # kill: def $xmm0 killed $xmm0 def $zmm0
; AVX512BW-NEXT:    vptestnmb %zmm0, %zmm1, %k0
; AVX512BW-NEXT:    kmovd %k0, %eax
; AVX512BW-NEXT:    andl %edi, %eax
; AVX512BW-NEXT:    # kill: def $ax killed $ax killed $eax
; AVX512BW-NEXT:    vzeroupper
; AVX512BW-NEXT:    retq
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <16 x i8>
  %1 = icmp eq <16 x i8> %0, zeroinitializer
  %2 = bitcast i16 %__U to <16 x i1>
  %3 = and <16 x i1> %1, %2
  %4 = bitcast <16 x i1> %3 to i16
  ret i16 %4
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm_testn_epi16_mask(<2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; AVX512BWVL-LABEL: TEST_mm_testn_epi16_mask:
; AVX512BWVL:       # %bb.0: # %entry
; AVX512BWVL-NEXT:    vptestnmw %xmm0, %xmm1, %k0
; AVX512BWVL-NEXT:    kmovd %k0, %eax
; AVX512BWVL-NEXT:    # kill: def $al killed $al killed $eax
; AVX512BWVL-NEXT:    retq
;
; AVX512BW-LABEL: TEST_mm_testn_epi16_mask:
; AVX512BW:       # %bb.0: # %entry
; AVX512BW-NEXT:    # kill: def $xmm1 killed $xmm1 def $zmm1
; AVX512BW-NEXT:    # kill: def $xmm0 killed $xmm0 def $zmm0
; AVX512BW-NEXT:    vptestnmw %zmm0, %zmm1, %k0
; AVX512BW-NEXT:    kmovd %k0, %eax
; AVX512BW-NEXT:    # kill: def $al killed $al killed $eax
; AVX512BW-NEXT:    vzeroupper
; AVX512BW-NEXT:    retq
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <8 x i16>
  %1 = icmp eq <8 x i16> %0, zeroinitializer
  %2 = bitcast <8 x i1> %1 to i8
  ret i8 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm_mask_testn_epi16_mask(i8 zeroext %__U, <2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; AVX512BWVL-LABEL: TEST_mm_mask_testn_epi16_mask:
; AVX512BWVL:       # %bb.0: # %entry
; AVX512BWVL-NEXT:    vptestnmw %xmm0, %xmm1, %k0
; AVX512BWVL-NEXT:    kmovd %k0, %eax
; AVX512BWVL-NEXT:    andb %dil, %al
; AVX512BWVL-NEXT:    # kill: def $al killed $al killed $eax
; AVX512BWVL-NEXT:    retq
;
; AVX512BW-LABEL: TEST_mm_mask_testn_epi16_mask:
; AVX512BW:       # %bb.0: # %entry
; AVX512BW-NEXT:    # kill: def $xmm1 killed $xmm1 def $zmm1
; AVX512BW-NEXT:    # kill: def $xmm0 killed $xmm0 def $zmm0
; AVX512BW-NEXT:    vptestnmw %zmm0, %zmm1, %k0
; AVX512BW-NEXT:    kmovd %k0, %eax
; AVX512BW-NEXT:    andb %dil, %al
; AVX512BW-NEXT:    # kill: def $al killed $al killed $eax
; AVX512BW-NEXT:    vzeroupper
; AVX512BW-NEXT:    retq
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <8 x i16>
  %1 = icmp eq <8 x i16> %0, zeroinitializer
  %2 = bitcast i8 %__U to <8 x i1>
  %3 = and <8 x i1> %1, %2
  %4 = bitcast <8 x i1> %3 to i8
  ret i8 %4
}

; Function Attrs: norecurse nounwind readnone
define i32 @TEST_mm256_test_epi8_mask(<4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; AVX512BWVL-LABEL: TEST_mm256_test_epi8_mask:
; AVX512BWVL:       # %bb.0: # %entry
; AVX512BWVL-NEXT:    vptestmb %ymm0, %ymm1, %k0
; AVX512BWVL-NEXT:    kmovd %k0, %eax
; AVX512BWVL-NEXT:    vzeroupper
; AVX512BWVL-NEXT:    retq
;
; AVX512BW-LABEL: TEST_mm256_test_epi8_mask:
; AVX512BW:       # %bb.0: # %entry
; AVX512BW-NEXT:    # kill: def $ymm1 killed $ymm1 def $zmm1
; AVX512BW-NEXT:    # kill: def $ymm0 killed $ymm0 def $zmm0
; AVX512BW-NEXT:    vptestmb %zmm0, %zmm1, %k0
; AVX512BW-NEXT:    kmovd %k0, %eax
; AVX512BW-NEXT:    vzeroupper
; AVX512BW-NEXT:    retq
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <32 x i8>
  %1 = icmp ne <32 x i8> %0, zeroinitializer
  %2 = bitcast <32 x i1> %1 to i32
  ret i32 %2
}

; Function Attrs: norecurse nounwind readnone
define i32 @TEST_mm256_mask_test_epi8_mask(i32 %__U, <4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; AVX512BWVL-LABEL: TEST_mm256_mask_test_epi8_mask:
; AVX512BWVL:       # %bb.0: # %entry
; AVX512BWVL-NEXT:    vptestmb %ymm0, %ymm1, %k0
; AVX512BWVL-NEXT:    kmovd %k0, %eax
; AVX512BWVL-NEXT:    andl %edi, %eax
; AVX512BWVL-NEXT:    vzeroupper
; AVX512BWVL-NEXT:    retq
;
; AVX512BW-LABEL: TEST_mm256_mask_test_epi8_mask:
; AVX512BW:       # %bb.0: # %entry
; AVX512BW-NEXT:    # kill: def $ymm1 killed $ymm1 def $zmm1
; AVX512BW-NEXT:    # kill: def $ymm0 killed $ymm0 def $zmm0
; AVX512BW-NEXT:    vptestmb %zmm0, %zmm1, %k0
; AVX512BW-NEXT:    kmovd %k0, %eax
; AVX512BW-NEXT:    andl %edi, %eax
; AVX512BW-NEXT:    vzeroupper
; AVX512BW-NEXT:    retq
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <32 x i8>
  %1 = icmp ne <32 x i8> %0, zeroinitializer
  %2 = bitcast i32 %__U to <32 x i1>
  %3 = and <32 x i1> %1, %2
  %4 = bitcast <32 x i1> %3 to i32
  ret i32 %4
}

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm256_test_epi16_mask(<4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; AVX512BWVL-LABEL: TEST_mm256_test_epi16_mask:
; AVX512BWVL:       # %bb.0: # %entry
; AVX512BWVL-NEXT:    vptestmw %ymm0, %ymm1, %k0
; AVX512BWVL-NEXT:    kmovd %k0, %eax
; AVX512BWVL-NEXT:    # kill: def $ax killed $ax killed $eax
; AVX512BWVL-NEXT:    vzeroupper
; AVX512BWVL-NEXT:    retq
;
; AVX512BW-LABEL: TEST_mm256_test_epi16_mask:
; AVX512BW:       # %bb.0: # %entry
; AVX512BW-NEXT:    # kill: def $ymm1 killed $ymm1 def $zmm1
; AVX512BW-NEXT:    # kill: def $ymm0 killed $ymm0 def $zmm0
; AVX512BW-NEXT:    vptestmw %zmm0, %zmm1, %k0
; AVX512BW-NEXT:    kmovd %k0, %eax
; AVX512BW-NEXT:    # kill: def $ax killed $ax killed $eax
; AVX512BW-NEXT:    vzeroupper
; AVX512BW-NEXT:    retq
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <16 x i16>
  %1 = icmp ne <16 x i16> %0, zeroinitializer
  %2 = bitcast <16 x i1> %1 to i16
  ret i16 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm256_mask_test_epi16_mask(i16 zeroext %__U, <4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; AVX512BWVL-LABEL: TEST_mm256_mask_test_epi16_mask:
; AVX512BWVL:       # %bb.0: # %entry
; AVX512BWVL-NEXT:    vptestmw %ymm0, %ymm1, %k0
; AVX512BWVL-NEXT:    kmovd %k0, %eax
; AVX512BWVL-NEXT:    andl %edi, %eax
; AVX512BWVL-NEXT:    # kill: def $ax killed $ax killed $eax
; AVX512BWVL-NEXT:    vzeroupper
; AVX512BWVL-NEXT:    retq
;
; AVX512BW-LABEL: TEST_mm256_mask_test_epi16_mask:
; AVX512BW:       # %bb.0: # %entry
; AVX512BW-NEXT:    # kill: def $ymm1 killed $ymm1 def $zmm1
; AVX512BW-NEXT:    # kill: def $ymm0 killed $ymm0 def $zmm0
; AVX512BW-NEXT:    vptestmw %zmm0, %zmm1, %k0
; AVX512BW-NEXT:    kmovd %k0, %eax
; AVX512BW-NEXT:    andl %edi, %eax
; AVX512BW-NEXT:    # kill: def $ax killed $ax killed $eax
; AVX512BW-NEXT:    vzeroupper
; AVX512BW-NEXT:    retq
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <16 x i16>
  %1 = icmp ne <16 x i16> %0, zeroinitializer
  %2 = bitcast i16 %__U to <16 x i1>
  %3 = and <16 x i1> %1, %2
  %4 = bitcast <16 x i1> %3 to i16
  ret i16 %4
}

; Function Attrs: norecurse nounwind readnone
define i32 @TEST_mm256_testn_epi8_mask(<4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; AVX512BWVL-LABEL: TEST_mm256_testn_epi8_mask:
; AVX512BWVL:       # %bb.0: # %entry
; AVX512BWVL-NEXT:    vptestnmb %ymm0, %ymm1, %k0
; AVX512BWVL-NEXT:    kmovd %k0, %eax
; AVX512BWVL-NEXT:    vzeroupper
; AVX512BWVL-NEXT:    retq
;
; AVX512BW-LABEL: TEST_mm256_testn_epi8_mask:
; AVX512BW:       # %bb.0: # %entry
; AVX512BW-NEXT:    # kill: def $ymm1 killed $ymm1 def $zmm1
; AVX512BW-NEXT:    # kill: def $ymm0 killed $ymm0 def $zmm0
; AVX512BW-NEXT:    vptestnmb %zmm0, %zmm1, %k0
; AVX512BW-NEXT:    kmovd %k0, %eax
; AVX512BW-NEXT:    vzeroupper
; AVX512BW-NEXT:    retq
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <32 x i8>
  %1 = icmp eq <32 x i8> %0, zeroinitializer
  %2 = bitcast <32 x i1> %1 to i32
  ret i32 %2
}

; Function Attrs: norecurse nounwind readnone
define i32 @TEST_mm256_mask_testn_epi8_mask(i32 %__U, <4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; AVX512BWVL-LABEL: TEST_mm256_mask_testn_epi8_mask:
; AVX512BWVL:       # %bb.0: # %entry
; AVX512BWVL-NEXT:    vptestnmb %ymm0, %ymm1, %k0
; AVX512BWVL-NEXT:    kmovd %k0, %eax
; AVX512BWVL-NEXT:    andl %edi, %eax
; AVX512BWVL-NEXT:    vzeroupper
; AVX512BWVL-NEXT:    retq
;
; AVX512BW-LABEL: TEST_mm256_mask_testn_epi8_mask:
; AVX512BW:       # %bb.0: # %entry
; AVX512BW-NEXT:    # kill: def $ymm1 killed $ymm1 def $zmm1
; AVX512BW-NEXT:    # kill: def $ymm0 killed $ymm0 def $zmm0
; AVX512BW-NEXT:    vptestnmb %zmm0, %zmm1, %k0
; AVX512BW-NEXT:    kmovd %k0, %eax
; AVX512BW-NEXT:    andl %edi, %eax
; AVX512BW-NEXT:    vzeroupper
; AVX512BW-NEXT:    retq
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <32 x i8>
  %1 = icmp eq <32 x i8> %0, zeroinitializer
  %2 = bitcast i32 %__U to <32 x i1>
  %3 = and <32 x i1> %1, %2
  %4 = bitcast <32 x i1> %3 to i32
  ret i32 %4
}

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm256_testn_epi16_mask(<4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; AVX512BWVL-LABEL: TEST_mm256_testn_epi16_mask:
; AVX512BWVL:       # %bb.0: # %entry
; AVX512BWVL-NEXT:    vptestnmw %ymm0, %ymm1, %k0
; AVX512BWVL-NEXT:    kmovd %k0, %eax
; AVX512BWVL-NEXT:    # kill: def $ax killed $ax killed $eax
; AVX512BWVL-NEXT:    vzeroupper
; AVX512BWVL-NEXT:    retq
;
; AVX512BW-LABEL: TEST_mm256_testn_epi16_mask:
; AVX512BW:       # %bb.0: # %entry
; AVX512BW-NEXT:    # kill: def $ymm1 killed $ymm1 def $zmm1
; AVX512BW-NEXT:    # kill: def $ymm0 killed $ymm0 def $zmm0
; AVX512BW-NEXT:    vptestnmw %zmm0, %zmm1, %k0
; AVX512BW-NEXT:    kmovd %k0, %eax
; AVX512BW-NEXT:    # kill: def $ax killed $ax killed $eax
; AVX512BW-NEXT:    vzeroupper
; AVX512BW-NEXT:    retq
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <16 x i16>
  %1 = icmp eq <16 x i16> %0, zeroinitializer
  %2 = bitcast <16 x i1> %1 to i16
  ret i16 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm256_mask_testn_epi16_mask(i16 zeroext %__U, <4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; AVX512BWVL-LABEL: TEST_mm256_mask_testn_epi16_mask:
; AVX512BWVL:       # %bb.0: # %entry
; AVX512BWVL-NEXT:    vptestnmw %ymm0, %ymm1, %k0
; AVX512BWVL-NEXT:    kmovd %k0, %eax
; AVX512BWVL-NEXT:    andl %edi, %eax
; AVX512BWVL-NEXT:    # kill: def $ax killed $ax killed $eax
; AVX512BWVL-NEXT:    vzeroupper
; AVX512BWVL-NEXT:    retq
;
; AVX512BW-LABEL: TEST_mm256_mask_testn_epi16_mask:
; AVX512BW:       # %bb.0: # %entry
; AVX512BW-NEXT:    # kill: def $ymm1 killed $ymm1 def $zmm1
; AVX512BW-NEXT:    # kill: def $ymm0 killed $ymm0 def $zmm0
; AVX512BW-NEXT:    vptestnmw %zmm0, %zmm1, %k0
; AVX512BW-NEXT:    kmovd %k0, %eax
; AVX512BW-NEXT:    andl %edi, %eax
; AVX512BW-NEXT:    # kill: def $ax killed $ax killed $eax
; AVX512BW-NEXT:    vzeroupper
; AVX512BW-NEXT:    retq
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <16 x i16>
  %1 = icmp eq <16 x i16> %0, zeroinitializer
  %2 = bitcast i16 %__U to <16 x i1>
  %3 = and <16 x i1> %1, %2
  %4 = bitcast <16 x i1> %3 to i16
  ret i16 %4
}

