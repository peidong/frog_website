; ModuleID = 'fd.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-f128:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__fsid_t = type { [2 x i32] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.dirent64 = type { i64, i64, i16, i8, [256 x i8] }
%struct.exe_disk_file_t = type { i32, i8*, %struct.stat* }
%struct.exe_file_system_t = type { i32, %struct.exe_disk_file_t*, %struct.exe_disk_file_t*, i32, %struct.exe_disk_file_t*, i32, i32*, i32*, i32*, i32*, i32*, i32*, i32* }
%struct.exe_file_t = type { i32, i32, i64, %struct.exe_disk_file_t* }
%struct.exe_sym_env_t = type { [32 x %struct.exe_file_t], i32, i32, i32 }
%struct.fd_set = type { [16 x i64] }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.statfs = type { i64, i64, i64, i64, i64, i64, i64, %struct.__fsid_t, i64, i64, i64, [4 x i64] }
%struct.timespec = type { i64, i64 }

@__exe_fs = external unnamed_addr global %struct.exe_file_system_t
@__exe_env = external unnamed_addr global %struct.exe_sym_env_t
@.str = private unnamed_addr constant [18 x i8] c"ignoring (ENOENT)\00", align 1
@.str1 = private unnamed_addr constant [17 x i8] c"ignoring (EPERM)\00", align 1
@.str2 = private unnamed_addr constant [32 x i8] c"symbolic file, ignoring (EPERM)\00", align 8
@.str3 = private unnamed_addr constant [32 x i8] c"symbolic file, ignoring (EBADF)\00", align 8
@n_calls.5261 = internal unnamed_addr global i32 0
@.str4 = private unnamed_addr constant [30 x i8] c"symbolic file, ignoring (EIO)\00", align 1
@.str5 = private unnamed_addr constant [33 x i8] c"symbolic file, ignoring (ENOENT)\00", align 8
@n_calls.5837 = internal unnamed_addr global i32 0
@.str6 = private unnamed_addr constant [44 x i8] c"symbolic file descriptor, ignoring (ENOENT)\00", align 8
@n_calls.4869 = internal unnamed_addr global i32 0
@.str7 = private unnamed_addr constant [47 x i8] c"Undefined call to open(): O_EXCL w/o O_RDONLY\0A\00", align 8
@.str8 = private unnamed_addr constant [33 x i8] c"symbolic file, ignoring (EINVAL)\00", align 8
@.str9 = private unnamed_addr constant [41 x i8] c"(TCGETS) symbolic file, incomplete model\00", align 8
@.str10 = private unnamed_addr constant [42 x i8] c"(TCSETS) symbolic file, silently ignoring\00", align 8
@.str11 = private unnamed_addr constant [43 x i8] c"(TCSETSW) symbolic file, silently ignoring\00", align 8
@.str12 = private unnamed_addr constant [43 x i8] c"(TCSETSF) symbolic file, silently ignoring\00", align 8
@.str13 = private unnamed_addr constant [45 x i8] c"(TIOCGWINSZ) symbolic file, incomplete model\00", align 8
@.str14 = private unnamed_addr constant [46 x i8] c"(TIOCSWINSZ) symbolic file, ignoring (EINVAL)\00", align 8
@.str15 = private unnamed_addr constant [43 x i8] c"(FIONREAD) symbolic file, incomplete model\00", align 8
@.str16 = private unnamed_addr constant [44 x i8] c"(MTIOCGET) symbolic file, ignoring (EINVAL)\00", align 8
@.str17 = private unnamed_addr constant [18 x i8] c"s != (off64_t) -1\00", align 1
@.str18 = private unnamed_addr constant [5 x i8] c"fd.c\00", align 1
@__PRETTY_FUNCTION__.5298 = internal unnamed_addr constant [14 x i8] c"__fd_getdents\00"
@.str19 = private unnamed_addr constant [18 x i8] c"new_off == f->off\00", align 1
@__PRETTY_FUNCTION__.5022 = internal unnamed_addr constant [11 x i8] c"__fd_lseek\00"
@n_calls.4950 = internal unnamed_addr global i32 0
@.str20 = private unnamed_addr constant [7 x i8] c"r >= 0\00", align 1
@__PRETTY_FUNCTION__.4953 = internal unnamed_addr constant [6 x i8] c"write\00"
@.str21 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str22 = private unnamed_addr constant [24 x i8] c"write() ignores bytes.\0A\00", align 1
@n_calls.4889 = internal unnamed_addr global i32 0
@.str23 = private unnamed_addr constant [12 x i8] c"f->off >= 0\00", align 1
@__PRETTY_FUNCTION__.4892 = internal unnamed_addr constant [5 x i8] c"read\00"
@n_calls.5168 = internal unnamed_addr global i32 0
@n_calls.5145 = internal unnamed_addr global i32 0

define i32 @access(i8* %pathname, i32 %mode) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !399), !dbg !608
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !400), !dbg !608
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !267), !dbg !609
  %0 = load i8* %pathname, align 1, !dbg !611
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !268), !dbg !611
  %1 = icmp eq i8 %0, 0, !dbg !612
  br i1 %1, label %bb1, label %bb.i, !dbg !612

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %pathname, i64 1, !dbg !612
  %3 = load i8* %2, align 1, !dbg !612
  %4 = icmp eq i8 %3, 0, !dbg !612
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !612

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !613
  %6 = sext i8 %0 to i32, !dbg !614
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !614
  %8 = add nsw i32 %7, 65, !dbg !614
  %9 = icmp eq i32 %6, %8, !dbg !614
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !614

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !615
  %11 = zext i32 %18 to i64, !dbg !615
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !271), !dbg !615
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !617
  %13 = load %struct.stat** %12, align 8, !dbg !617
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !617
  %15 = load i64* %14, align 8, !dbg !617
  %16 = icmp eq i64 %15, 0, !dbg !617
  br i1 %16, label %bb1, label %__get_sym_file.exit, !dbg !617

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !613
  br label %bb8.i, !dbg !613

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !613
  br i1 %19, label %bb3.i, label %bb1, !dbg !613

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !615
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %20}, i64 0, metadata !401), !dbg !610
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !618
  br i1 %21, label %bb1, label %bb4, !dbg !618

bb1:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !354) nounwind, !dbg !619
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !344) nounwind, !dbg !621
  %22 = ptrtoint i8* %pathname to i64, !dbg !623
  %23 = tail call i64 @klee_get_valuel(i64 %22) nounwind, !dbg !623
  %24 = inttoptr i64 %23 to i8*, !dbg !623
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !345) nounwind, !dbg !623
  %25 = icmp eq i8* %24, %pathname, !dbg !624
  %26 = zext i1 %25 to i64, !dbg !624
  tail call void @klee_assume(i64 %26) nounwind, !dbg !624
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !355) nounwind, !dbg !622
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !357) nounwind, !dbg !626
  br label %bb.i6, !dbg !626

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.0.i = phi i8* [ %24, %bb1 ], [ %sc.1.i, %bb6.i8 ]
  %27 = phi i32 [ 0, %bb1 ], [ %39, %bb6.i8 ]
  %tmp.i = add i32 %27, -1
  %28 = load i8* %sc.0.i, align 1, !dbg !627
  %29 = and i32 %tmp.i, %27, !dbg !628
  %30 = icmp eq i32 %29, 0, !dbg !628
  br i1 %30, label %bb1.i, label %bb5.i, !dbg !628

bb1.i:                                            ; preds = %bb.i6
  switch i8 %28, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %28}, i64 0, metadata !358) nounwind, !dbg !627
  store i8 0, i8* %sc.0.i, align 1, !dbg !629
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !355) nounwind, !dbg !629
  br label %__concretize_string.exit, !dbg !629

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !630
  %31 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !630
  br label %bb6.i8, !dbg !630

bb5.i:                                            ; preds = %bb.i6
  %32 = sext i8 %28 to i64, !dbg !631
  %33 = tail call i64 @klee_get_valuel(i64 %32) nounwind, !dbg !631
  %34 = trunc i64 %33 to i8, !dbg !631
  %35 = icmp eq i8 %34, %28, !dbg !632
  %36 = zext i1 %35 to i64, !dbg !632
  tail call void @klee_assume(i64 %36) nounwind, !dbg !632
  store i8 %34, i8* %sc.0.i, align 1, !dbg !633
  %37 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !633
  %38 = icmp eq i8 %34, 0, !dbg !634
  br i1 %38, label %__concretize_string.exit, label %bb6.i8, !dbg !634

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.1.i = phi i8* [ %31, %bb4.i7 ], [ %37, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %39 = add i32 %27, 1, !dbg !626
  br label %bb.i6, !dbg !626

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %40 = tail call i64 (i64, ...)* @syscall(i64 21, i8* %pathname, i32 %mode) nounwind, !dbg !620
  %41 = trunc i64 %40 to i32, !dbg !620
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !403), !dbg !620
  %42 = icmp eq i32 %41, -1, !dbg !635
  br i1 %42, label %bb2, label %bb4, !dbg !635

bb2:                                              ; preds = %__concretize_string.exit
  %43 = tail call i32* @__errno_location() nounwind readnone, !dbg !636
  %44 = tail call i32 @klee_get_errno() nounwind, !dbg !636
  store i32 %44, i32* %43, align 4, !dbg !636
  br label %bb4, !dbg !636

bb4:                                              ; preds = %__concretize_string.exit, %bb2, %__get_sym_file.exit
  %.0 = phi i32 [ 0, %__get_sym_file.exit ], [ -1, %bb2 ], [ %41, %__concretize_string.exit ]
  ret i32 %.0, !dbg !637
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i32 @umask(i32 %mask) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %mask}, i64 0, metadata !277), !dbg !638
  %0 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 1), align 8, !dbg !639
  tail call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !278), !dbg !639
  %1 = and i32 %mask, 511, !dbg !640
  store i32 %1, i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 1), align 8, !dbg !640
  ret i32 %0, !dbg !641
}

define i32 @chroot(i8* nocapture %path) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !286), !dbg !642
  %0 = load i8* %path, align 1, !dbg !643
  switch i8 %0, label %bb4 [
    i8 0, label %bb
    i8 47, label %bb2
  ]

bb:                                               ; preds = %entry
  %1 = tail call i32* @__errno_location() nounwind readnone, !dbg !645
  store i32 2, i32* %1, align 4, !dbg !645
  br label %bb5, !dbg !646

bb2:                                              ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !647
  %3 = load i8* %2, align 1, !dbg !647
  %4 = icmp eq i8 %3, 0, !dbg !647
  br i1 %4, label %bb5, label %bb4, !dbg !647

bb4:                                              ; preds = %entry, %bb2
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !648
  %5 = tail call i32* @__errno_location() nounwind readnone, !dbg !649
  store i32 2, i32* %5, align 4, !dbg !649
  br label %bb5, !dbg !650

bb5:                                              ; preds = %bb2, %bb4, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb4 ], [ 0, %bb2 ]
  ret i32 %.0, !dbg !646
}

declare i32* @__errno_location() nounwind readnone

declare void @klee_warning(i8*)

define i32 @unlinkat(i32 %dirfd, i8* nocapture %pathname, i32 %flags) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %dirfd}, i64 0, metadata !287), !dbg !651
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !288), !dbg !651
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !289), !dbg !651
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !267), !dbg !652
  %0 = load i8* %pathname, align 1, !dbg !654
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !268), !dbg !654
  %1 = icmp eq i8 %0, 0, !dbg !655
  br i1 %1, label %bb5, label %bb.i, !dbg !655

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %pathname, i64 1, !dbg !655
  %3 = load i8* %2, align 1, !dbg !655
  %4 = icmp eq i8 %3, 0, !dbg !655
  br i1 %4, label %bb8.preheader.i, label %bb5, !dbg !655

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !656
  %6 = sext i8 %0 to i32, !dbg !657
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !657
  %8 = add nsw i32 %7, 65, !dbg !657
  %9 = icmp eq i32 %6, %8, !dbg !657
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !657

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !658
  %11 = zext i32 %18 to i64, !dbg !658
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !271), !dbg !658
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !659
  %13 = load %struct.stat** %12, align 8, !dbg !659
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !659
  %15 = load i64* %14, align 8, !dbg !659
  %16 = icmp eq i64 %15, 0, !dbg !659
  br i1 %16, label %bb5, label %__get_sym_file.exit, !dbg !659

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !656
  br label %bb8.i, !dbg !656

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !656
  br i1 %19, label %bb3.i, label %bb5, !dbg !656

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !658
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %20}, i64 0, metadata !290), !dbg !653
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !660
  br i1 %21, label %bb5, label %bb, !dbg !660

bb:                                               ; preds = %__get_sym_file.exit
  %22 = getelementptr inbounds %struct.stat* %13, i64 0, i32 3, !dbg !661
  %23 = load i32* %22, align 8, !dbg !661
  %24 = and i32 %23, 61440, !dbg !661
  %25 = icmp eq i32 %24, 32768, !dbg !661
  br i1 %25, label %bb1, label %bb2, !dbg !661

bb1:                                              ; preds = %bb
  store i64 0, i64* %14, align 8, !dbg !662
  br label %bb6, !dbg !663

bb2:                                              ; preds = %bb
  %26 = icmp eq i32 %24, 16384, !dbg !664
  %27 = tail call i32* @__errno_location() nounwind readnone, !dbg !665
  br i1 %26, label %bb3, label %bb4, !dbg !664

bb3:                                              ; preds = %bb2
  store i32 21, i32* %27, align 4, !dbg !665
  br label %bb6, !dbg !666

bb4:                                              ; preds = %bb2
  store i32 1, i32* %27, align 4, !dbg !667
  br label %bb6, !dbg !668

bb5:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str1, i64 0, i64 0)) nounwind, !dbg !669
  %28 = tail call i32* @__errno_location() nounwind readnone, !dbg !670
  store i32 1, i32* %28, align 4, !dbg !670
  br label %bb6, !dbg !671

bb6:                                              ; preds = %bb5, %bb4, %bb3, %bb1
  %.0 = phi i32 [ 0, %bb1 ], [ -1, %bb3 ], [ -1, %bb4 ], [ -1, %bb5 ]
  ret i32 %.0, !dbg !663
}

define i32 @unlink(i8* nocapture %pathname) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !292), !dbg !672
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !267), !dbg !673
  %0 = load i8* %pathname, align 1, !dbg !675
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !268), !dbg !675
  %1 = icmp eq i8 %0, 0, !dbg !676
  br i1 %1, label %bb5, label %bb.i, !dbg !676

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %pathname, i64 1, !dbg !676
  %3 = load i8* %2, align 1, !dbg !676
  %4 = icmp eq i8 %3, 0, !dbg !676
  br i1 %4, label %bb8.preheader.i, label %bb5, !dbg !676

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !677
  %6 = sext i8 %0 to i32, !dbg !678
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !678
  %8 = add nsw i32 %7, 65, !dbg !678
  %9 = icmp eq i32 %6, %8, !dbg !678
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !678

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !679
  %11 = zext i32 %18 to i64, !dbg !679
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !271), !dbg !679
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !680
  %13 = load %struct.stat** %12, align 8, !dbg !680
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !680
  %15 = load i64* %14, align 8, !dbg !680
  %16 = icmp eq i64 %15, 0, !dbg !680
  br i1 %16, label %bb5, label %__get_sym_file.exit, !dbg !680

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !677
  br label %bb8.i, !dbg !677

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !677
  br i1 %19, label %bb3.i, label %bb5, !dbg !677

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !679
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %20}, i64 0, metadata !293), !dbg !674
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !681
  br i1 %21, label %bb5, label %bb, !dbg !681

bb:                                               ; preds = %__get_sym_file.exit
  %22 = getelementptr inbounds %struct.stat* %13, i64 0, i32 3, !dbg !682
  %23 = load i32* %22, align 8, !dbg !682
  %24 = and i32 %23, 61440, !dbg !682
  %25 = icmp eq i32 %24, 32768, !dbg !682
  br i1 %25, label %bb1, label %bb2, !dbg !682

bb1:                                              ; preds = %bb
  store i64 0, i64* %14, align 8, !dbg !683
  br label %bb6, !dbg !684

bb2:                                              ; preds = %bb
  %26 = icmp eq i32 %24, 16384, !dbg !685
  %27 = tail call i32* @__errno_location() nounwind readnone, !dbg !686
  br i1 %26, label %bb3, label %bb4, !dbg !685

bb3:                                              ; preds = %bb2
  store i32 21, i32* %27, align 4, !dbg !686
  br label %bb6, !dbg !687

bb4:                                              ; preds = %bb2
  store i32 1, i32* %27, align 4, !dbg !688
  br label %bb6, !dbg !689

bb5:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str1, i64 0, i64 0)) nounwind, !dbg !690
  %28 = tail call i32* @__errno_location() nounwind readnone, !dbg !691
  store i32 1, i32* %28, align 4, !dbg !691
  br label %bb6, !dbg !692

bb6:                                              ; preds = %bb5, %bb4, %bb3, %bb1
  %.0 = phi i32 [ 0, %bb1 ], [ -1, %bb3 ], [ -1, %bb4 ], [ -1, %bb5 ]
  ret i32 %.0, !dbg !684
}

define i32 @rmdir(i8* nocapture %pathname) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !295), !dbg !693
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !267), !dbg !694
  %0 = load i8* %pathname, align 1, !dbg !696
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !268), !dbg !696
  %1 = icmp eq i8 %0, 0, !dbg !697
  br i1 %1, label %bb3, label %bb.i, !dbg !697

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %pathname, i64 1, !dbg !697
  %3 = load i8* %2, align 1, !dbg !697
  %4 = icmp eq i8 %3, 0, !dbg !697
  br i1 %4, label %bb8.preheader.i, label %bb3, !dbg !697

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !698
  %6 = sext i8 %0 to i32, !dbg !699
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !699
  %8 = add nsw i32 %7, 65, !dbg !699
  %9 = icmp eq i32 %6, %8, !dbg !699
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !699

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !700
  %11 = zext i32 %18 to i64, !dbg !700
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !271), !dbg !700
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !701
  %13 = load %struct.stat** %12, align 8, !dbg !701
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !701
  %15 = load i64* %14, align 8, !dbg !701
  %16 = icmp eq i64 %15, 0, !dbg !701
  br i1 %16, label %bb3, label %__get_sym_file.exit, !dbg !701

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !698
  br label %bb8.i, !dbg !698

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !698
  br i1 %19, label %bb3.i, label %bb3, !dbg !698

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !700
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %20}, i64 0, metadata !296), !dbg !695
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !702
  br i1 %21, label %bb3, label %bb, !dbg !702

bb:                                               ; preds = %__get_sym_file.exit
  %22 = getelementptr inbounds %struct.stat* %13, i64 0, i32 3, !dbg !703
  %23 = load i32* %22, align 8, !dbg !703
  %24 = and i32 %23, 61440, !dbg !703
  %25 = icmp eq i32 %24, 16384, !dbg !703
  br i1 %25, label %bb1, label %bb2, !dbg !703

bb1:                                              ; preds = %bb
  store i64 0, i64* %14, align 8, !dbg !704
  br label %bb4, !dbg !705

bb2:                                              ; preds = %bb
  %26 = tail call i32* @__errno_location() nounwind readnone, !dbg !706
  store i32 20, i32* %26, align 4, !dbg !706
  br label %bb4, !dbg !707

bb3:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str1, i64 0, i64 0)) nounwind, !dbg !708
  %27 = tail call i32* @__errno_location() nounwind readnone, !dbg !709
  store i32 1, i32* %27, align 4, !dbg !709
  br label %bb4, !dbg !710

bb4:                                              ; preds = %bb3, %bb2, %bb1
  %.0 = phi i32 [ 0, %bb1 ], [ -1, %bb2 ], [ -1, %bb3 ]
  ret i32 %.0, !dbg !705
}

define i64 @readlink(i8* %path, i8* %buf, i64 %bufsize) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !301), !dbg !711
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !302), !dbg !711
  tail call void @llvm.dbg.value(metadata !{i64 %bufsize}, i64 0, metadata !303), !dbg !711
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !267), !dbg !712
  %0 = load i8* %path, align 1, !dbg !714
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !268), !dbg !714
  %1 = icmp eq i8 %0, 0, !dbg !715
  br i1 %1, label %bb12, label %bb.i, !dbg !715

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !715
  %3 = load i8* %2, align 1, !dbg !715
  %4 = icmp eq i8 %3, 0, !dbg !715
  br i1 %4, label %bb8.preheader.i, label %bb12, !dbg !715

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !716
  %6 = sext i8 %0 to i32, !dbg !717
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !717
  %8 = add nsw i32 %7, 65, !dbg !717
  %9 = icmp eq i32 %6, %8, !dbg !717
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !717

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !718
  %11 = zext i32 %18 to i64, !dbg !718
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !271), !dbg !718
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !719
  %13 = load %struct.stat** %12, align 8, !dbg !719
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !719
  %15 = load i64* %14, align 8, !dbg !719
  %16 = icmp eq i64 %15, 0, !dbg !719
  br i1 %16, label %bb12, label %__get_sym_file.exit, !dbg !719

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !716
  br label %bb8.i, !dbg !716

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !716
  br i1 %19, label %bb3.i, label %bb12, !dbg !716

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !718
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %20}, i64 0, metadata !304), !dbg !713
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !720
  br i1 %21, label %bb12, label %bb, !dbg !720

bb:                                               ; preds = %__get_sym_file.exit
  %22 = getelementptr inbounds %struct.stat* %13, i64 0, i32 3, !dbg !721
  %23 = load i32* %22, align 8, !dbg !721
  %24 = and i32 %23, 61440, !dbg !721
  %25 = icmp eq i32 %24, 40960, !dbg !721
  br i1 %25, label %bb1, label %bb11, !dbg !721

bb1:                                              ; preds = %bb
  store i8 %0, i8* %buf, align 1, !dbg !722
  %26 = icmp ugt i64 %bufsize, 1, !dbg !723
  br i1 %26, label %bb3, label %bb9, !dbg !723

bb3:                                              ; preds = %bb1
  %27 = getelementptr inbounds i8* %buf, i64 1, !dbg !723
  store i8 46, i8* %27, align 1, !dbg !723
  %28 = icmp ugt i64 %bufsize, 2, !dbg !724
  br i1 %28, label %bb5, label %bb9, !dbg !724

bb5:                                              ; preds = %bb3
  %29 = getelementptr inbounds i8* %buf, i64 2, !dbg !724
  store i8 108, i8* %29, align 1, !dbg !724
  %30 = icmp ugt i64 %bufsize, 3, !dbg !725
  br i1 %30, label %bb7, label %bb9, !dbg !725

bb7:                                              ; preds = %bb5
  %31 = getelementptr inbounds i8* %buf, i64 3, !dbg !725
  store i8 110, i8* %31, align 1, !dbg !725
  %32 = icmp ugt i64 %bufsize, 4, !dbg !726
  br i1 %32, label %bb8, label %bb9, !dbg !726

bb8:                                              ; preds = %bb7
  %33 = getelementptr inbounds i8* %buf, i64 4, !dbg !726
  store i8 107, i8* %33, align 1, !dbg !726
  br label %bb9, !dbg !726

bb9:                                              ; preds = %bb3, %bb1, %bb5, %bb8, %bb7
  %34 = icmp ugt i64 %bufsize, 5, !dbg !727
  %min = select i1 %34, i64 5, i64 %bufsize, !dbg !727
  br label %bb15, !dbg !727

bb11:                                             ; preds = %bb
  %35 = tail call i32* @__errno_location() nounwind readnone, !dbg !728
  store i32 22, i32* %35, align 4, !dbg !728
  br label %bb15, !dbg !729

bb12:                                             ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  %36 = tail call i64 (i64, ...)* @syscall(i64 89, i8* %path, i8* %buf, i64 %bufsize) nounwind, !dbg !730
  %37 = trunc i64 %36 to i32, !dbg !730
  tail call void @llvm.dbg.value(metadata !{i32 %37}, i64 0, metadata !306), !dbg !730
  %38 = icmp eq i32 %37, -1, !dbg !731
  br i1 %38, label %bb13, label %bb14, !dbg !731

bb13:                                             ; preds = %bb12
  %39 = tail call i32* @__errno_location() nounwind readnone, !dbg !732
  %40 = tail call i32 @klee_get_errno() nounwind, !dbg !732
  store i32 %40, i32* %39, align 4, !dbg !732
  br label %bb14, !dbg !732

bb14:                                             ; preds = %bb13, %bb12
  %41 = sext i32 %37 to i64, !dbg !733
  br label %bb15, !dbg !733

bb15:                                             ; preds = %bb14, %bb11, %bb9
  %.0 = phi i64 [ %min, %bb9 ], [ -1, %bb11 ], [ %41, %bb14 ]
  ret i64 %.0, !dbg !727
}

declare i64 @syscall(i64, ...) nounwind

declare i32 @klee_get_errno()

define i32 @fsync(i32 %fd) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !308), !dbg !734
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !273), !dbg !735
  %0 = icmp ult i32 %fd, 32, !dbg !737
  br i1 %0, label %bb.i, label %bb, !dbg !737

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !738
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !738
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1, !dbg !739
  %3 = load i32* %2, align 4, !dbg !739
  %4 = and i32 %3, 1
  %toBool.i = icmp eq i32 %4, 0, !dbg !739
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !739

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, !dbg !738
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !309), !dbg !736
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !740
  br i1 %6, label %bb, label %bb1, !dbg !740

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !741
  store i32 9, i32* %7, align 4, !dbg !741
  br label %bb6, !dbg !742

bb1:                                              ; preds = %__get_file.exit
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3, !dbg !743
  %9 = load %struct.exe_disk_file_t** %8, align 8, !dbg !743
  %10 = icmp eq %struct.exe_disk_file_t* %9, null, !dbg !743
  br i1 %10, label %bb3, label %bb6, !dbg !743

bb3:                                              ; preds = %bb1
  %11 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0, !dbg !744
  %12 = load i32* %11, align 8, !dbg !744
  %13 = tail call i64 (i64, ...)* @syscall(i64 74, i32 %12) nounwind, !dbg !744
  %14 = trunc i64 %13 to i32, !dbg !744
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !311), !dbg !744
  %15 = icmp eq i32 %14, -1, !dbg !745
  br i1 %15, label %bb4, label %bb6, !dbg !745

bb4:                                              ; preds = %bb3
  %16 = tail call i32* @__errno_location() nounwind readnone, !dbg !746
  %17 = tail call i32 @klee_get_errno() nounwind, !dbg !746
  store i32 %17, i32* %16, align 4, !dbg !746
  br label %bb6, !dbg !746

bb6:                                              ; preds = %bb3, %bb4, %bb1, %bb
  %.0 = phi i32 [ -1, %bb ], [ 0, %bb1 ], [ -1, %bb4 ], [ %14, %bb3 ]
  ret i32 %.0, !dbg !742
}

define i32 @fstatfs(i32 %fd, %struct.statfs* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !313), !dbg !747
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf}, i64 0, metadata !314), !dbg !747
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !273), !dbg !748
  %0 = icmp ult i32 %fd, 32, !dbg !750
  br i1 %0, label %bb.i, label %bb, !dbg !750

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !751
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !751
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1, !dbg !752
  %3 = load i32* %2, align 4, !dbg !752
  %4 = and i32 %3, 1
  %toBool.i = icmp eq i32 %4, 0, !dbg !752
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !752

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, !dbg !751
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !315), !dbg !749
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !753
  br i1 %6, label %bb, label %bb1, !dbg !753

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !754
  store i32 9, i32* %7, align 4, !dbg !754
  br label %bb6, !dbg !755

bb1:                                              ; preds = %__get_file.exit
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3, !dbg !756
  %9 = load %struct.exe_disk_file_t** %8, align 8, !dbg !756
  %10 = icmp eq %struct.exe_disk_file_t* %9, null, !dbg !756
  br i1 %10, label %bb3, label %bb2, !dbg !756

bb2:                                              ; preds = %bb1
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str3, i64 0, i64 0)) nounwind, !dbg !757
  %11 = tail call i32* @__errno_location() nounwind readnone, !dbg !758
  store i32 9, i32* %11, align 4, !dbg !758
  br label %bb6, !dbg !759

bb3:                                              ; preds = %bb1
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0, !dbg !760
  %13 = load i32* %12, align 8, !dbg !760
  %14 = tail call i64 (i64, ...)* @syscall(i64 138, i32 %13, %struct.statfs* %buf) nounwind, !dbg !760
  %15 = trunc i64 %14 to i32, !dbg !760
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !317), !dbg !760
  %16 = icmp eq i32 %15, -1, !dbg !761
  br i1 %16, label %bb4, label %bb6, !dbg !761

bb4:                                              ; preds = %bb3
  %17 = tail call i32* @__errno_location() nounwind readnone, !dbg !762
  %18 = tail call i32 @klee_get_errno() nounwind, !dbg !762
  store i32 %18, i32* %17, align 4, !dbg !762
  br label %bb6, !dbg !762

bb6:                                              ; preds = %bb3, %bb4, %bb2, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb2 ], [ -1, %bb4 ], [ %15, %bb3 ]
  ret i32 %.0, !dbg !755
}

define i32 @__fd_ftruncate(i32 %fd, i64 %length) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !319), !dbg !763
  tail call void @llvm.dbg.value(metadata !{i64 %length}, i64 0, metadata !320), !dbg !763
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !273), !dbg !764
  %0 = icmp ult i32 %fd, 32, !dbg !766
  br i1 %0, label %bb.i, label %__get_file.exit.thread, !dbg !766

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !767
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !767
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1, !dbg !768
  %3 = load i32* %2, align 4, !dbg !768
  %4 = and i32 %3, 1
  %toBool.i = icmp eq i32 %4, 0, !dbg !768
  br i1 %toBool.i, label %__get_file.exit.thread, label %__get_file.exit, !dbg !768

__get_file.exit.thread:                           ; preds = %bb.i, %entry
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %7}, i64 0, metadata !321), !dbg !765
  %5 = load i32* @n_calls.5261, align 4, !dbg !769
  %6 = add nsw i32 %5, 1, !dbg !769
  store i32 %6, i32* @n_calls.5261, align 4, !dbg !769
  br label %bb

__get_file.exit:                                  ; preds = %bb.i
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, !dbg !767
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %7}, i64 0, metadata !321), !dbg !765
  %8 = load i32* @n_calls.5261, align 4, !dbg !769
  %9 = add nsw i32 %8, 1, !dbg !769
  store i32 %9, i32* @n_calls.5261, align 4, !dbg !769
  %10 = icmp eq %struct.exe_file_t* %7, null, !dbg !770
  br i1 %10, label %bb, label %bb1, !dbg !770

bb:                                               ; preds = %__get_file.exit.thread, %__get_file.exit
  %11 = tail call i32* @__errno_location() nounwind readnone, !dbg !771
  store i32 9, i32* %11, align 4, !dbg !771
  br label %bb9, !dbg !772

bb1:                                              ; preds = %__get_file.exit
  %12 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !773
  %13 = icmp eq i32 %12, 0, !dbg !773
  br i1 %13, label %bb4, label %bb2, !dbg !773

bb2:                                              ; preds = %bb1
  %14 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 9), align 8, !dbg !773
  %15 = load i32* %14, align 4, !dbg !773
  %16 = icmp eq i32 %15, %9, !dbg !773
  br i1 %16, label %bb3, label %bb4, !dbg !773

bb3:                                              ; preds = %bb2
  %17 = add i32 %12, -1, !dbg !774
  store i32 %17, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !774
  %18 = tail call i32* @__errno_location() nounwind readnone, !dbg !775
  store i32 5, i32* %18, align 4, !dbg !775
  br label %bb9, !dbg !776

bb4:                                              ; preds = %bb1, %bb2
  %19 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3, !dbg !777
  %20 = load %struct.exe_disk_file_t** %19, align 8, !dbg !777
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !777
  br i1 %21, label %bb6, label %bb5, !dbg !777

bb5:                                              ; preds = %bb4
  tail call void @klee_warning(i8* getelementptr inbounds ([30 x i8]* @.str4, i64 0, i64 0)) nounwind, !dbg !778
  %22 = tail call i32* @__errno_location() nounwind readnone, !dbg !779
  store i32 5, i32* %22, align 4, !dbg !779
  br label %bb9, !dbg !780

bb6:                                              ; preds = %bb4
  %23 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0, !dbg !781
  %24 = load i32* %23, align 8, !dbg !781
  %25 = tail call i64 (i64, ...)* @syscall(i64 77, i32 %24, i64 %length) nounwind, !dbg !781
  %26 = trunc i64 %25 to i32, !dbg !781
  tail call void @llvm.dbg.value(metadata !{i32 %26}, i64 0, metadata !323), !dbg !781
  %27 = icmp eq i32 %26, -1, !dbg !782
  br i1 %27, label %bb7, label %bb9, !dbg !782

bb7:                                              ; preds = %bb6
  %28 = tail call i32* @__errno_location() nounwind readnone, !dbg !783
  %29 = tail call i32 @klee_get_errno() nounwind, !dbg !783
  store i32 %29, i32* %28, align 4, !dbg !783
  br label %bb9, !dbg !783

bb9:                                              ; preds = %bb6, %bb7, %bb5, %bb3, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb3 ], [ -1, %bb5 ], [ -1, %bb7 ], [ %26, %bb6 ]
  ret i32 %.0, !dbg !772
}

define i32 @fchown(i32 %fd, i32 %owner, i32 %group) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !332), !dbg !784
  tail call void @llvm.dbg.value(metadata !{i32 %owner}, i64 0, metadata !333), !dbg !784
  tail call void @llvm.dbg.value(metadata !{i32 %group}, i64 0, metadata !334), !dbg !784
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !273), !dbg !785
  %0 = icmp ult i32 %fd, 32, !dbg !787
  br i1 %0, label %bb.i, label %bb, !dbg !787

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !788
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !788
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1, !dbg !789
  %3 = load i32* %2, align 4, !dbg !789
  %4 = and i32 %3, 1
  %toBool.i = icmp eq i32 %4, 0, !dbg !789
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !789

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, !dbg !788
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !335), !dbg !786
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !790
  br i1 %6, label %bb, label %bb1, !dbg !790

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !791
  store i32 9, i32* %7, align 4, !dbg !791
  br label %bb6, !dbg !792

bb1:                                              ; preds = %__get_file.exit
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3, !dbg !793
  %9 = load %struct.exe_disk_file_t** %8, align 8, !dbg !793
  %10 = icmp eq %struct.exe_disk_file_t* %9, null, !dbg !793
  br i1 %10, label %bb3, label %bb2, !dbg !793

bb2:                                              ; preds = %bb1
  tail call void @llvm.dbg.value(metadata !794, i64 0, metadata !298) nounwind, !dbg !795
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !299) nounwind, !dbg !795
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !300) nounwind, !dbg !795
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str2, i64 0, i64 0)) nounwind, !dbg !797
  %11 = tail call i32* @__errno_location() nounwind readnone, !dbg !799
  store i32 1, i32* %11, align 4, !dbg !799
  br label %bb6, !dbg !796

bb3:                                              ; preds = %bb1
  %12 = tail call i64 (i64, ...)* @syscall(i64 93, i32 %fd, i32 %owner, i32 %group) nounwind, !dbg !800
  %13 = trunc i64 %12 to i32, !dbg !800
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !337), !dbg !800
  %14 = icmp eq i32 %13, -1, !dbg !801
  br i1 %14, label %bb4, label %bb6, !dbg !801

bb4:                                              ; preds = %bb3
  %15 = tail call i32* @__errno_location() nounwind readnone, !dbg !802
  %16 = tail call i32 @klee_get_errno() nounwind, !dbg !802
  store i32 %16, i32* %15, align 4, !dbg !802
  br label %bb6, !dbg !802

bb6:                                              ; preds = %bb3, %bb4, %bb2, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb2 ], [ -1, %bb4 ], [ %13, %bb3 ]
  ret i32 %.0, !dbg !792
}

define i32 @fchdir(i32 %fd) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !339), !dbg !803
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !273), !dbg !804
  %0 = icmp ult i32 %fd, 32, !dbg !806
  br i1 %0, label %bb.i, label %bb, !dbg !806

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !807
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !807
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1, !dbg !808
  %3 = load i32* %2, align 4, !dbg !808
  %4 = and i32 %3, 1
  %toBool.i = icmp eq i32 %4, 0, !dbg !808
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !808

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, !dbg !807
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !340), !dbg !805
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !809
  br i1 %6, label %bb, label %bb1, !dbg !809

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !810
  store i32 9, i32* %7, align 4, !dbg !810
  br label %bb6, !dbg !811

bb1:                                              ; preds = %__get_file.exit
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3, !dbg !812
  %9 = load %struct.exe_disk_file_t** %8, align 8, !dbg !812
  %10 = icmp eq %struct.exe_disk_file_t* %9, null, !dbg !812
  br i1 %10, label %bb3, label %bb2, !dbg !812

bb2:                                              ; preds = %bb1
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str5, i64 0, i64 0)) nounwind, !dbg !813
  %11 = tail call i32* @__errno_location() nounwind readnone, !dbg !814
  store i32 2, i32* %11, align 4, !dbg !814
  br label %bb6, !dbg !815

bb3:                                              ; preds = %bb1
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0, !dbg !816
  %13 = load i32* %12, align 8, !dbg !816
  %14 = tail call i64 (i64, ...)* @syscall(i64 81, i32 %13) nounwind, !dbg !816
  %15 = trunc i64 %14 to i32, !dbg !816
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !342), !dbg !816
  %16 = icmp eq i32 %15, -1, !dbg !817
  br i1 %16, label %bb4, label %bb6, !dbg !817

bb4:                                              ; preds = %bb3
  %17 = tail call i32* @__errno_location() nounwind readnone, !dbg !818
  %18 = tail call i32 @klee_get_errno() nounwind, !dbg !818
  store i32 %18, i32* %17, align 4, !dbg !818
  br label %bb6, !dbg !818

bb6:                                              ; preds = %bb3, %bb4, %bb2, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb2 ], [ -1, %bb4 ], [ %15, %bb3 ]
  ret i32 %.0, !dbg !811
}

declare i64 @klee_get_valuel(i64)

declare void @klee_assume(i64)

define i8* @getcwd(i8* %buf, i64 %size) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !350), !dbg !819
  tail call void @llvm.dbg.value(metadata !{i64 %size}, i64 0, metadata !351), !dbg !819
  %0 = load i32* @n_calls.5837, align 4, !dbg !820
  %1 = add nsw i32 %0, 1, !dbg !820
  store i32 %1, i32* @n_calls.5837, align 4, !dbg !820
  %2 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !821
  %3 = icmp eq i32 %2, 0, !dbg !821
  br i1 %3, label %bb2, label %bb, !dbg !821

bb:                                               ; preds = %entry
  %4 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 10), align 8, !dbg !821
  %5 = load i32* %4, align 4, !dbg !821
  %6 = icmp eq i32 %5, %1, !dbg !821
  br i1 %6, label %bb1, label %bb2, !dbg !821

bb1:                                              ; preds = %bb
  %7 = add i32 %2, -1, !dbg !822
  store i32 %7, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !822
  %8 = tail call i32* @__errno_location() nounwind readnone, !dbg !823
  store i32 34, i32* %8, align 4, !dbg !823
  br label %bb9, !dbg !824

bb2:                                              ; preds = %entry, %bb
  %9 = icmp eq i8* %buf, null, !dbg !825
  br i1 %9, label %bb3, label %bb6, !dbg !825

bb3:                                              ; preds = %bb2
  %10 = icmp eq i64 %size, 0, !dbg !826
  tail call void @llvm.dbg.value(metadata !827, i64 0, metadata !351), !dbg !828
  %size_addr.0 = select i1 %10, i64 1024, i64 %size
  %11 = tail call noalias i8* @malloc(i64 %size_addr.0) nounwind, !dbg !829
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !350), !dbg !829
  br label %bb6, !dbg !829

bb6:                                              ; preds = %bb3, %bb2
  %size_addr.1 = phi i64 [ %size_addr.0, %bb3 ], [ %size, %bb2 ]
  %buf_addr.0 = phi i8* [ %11, %bb3 ], [ %buf, %bb2 ]
  tail call void @llvm.dbg.value(metadata !{i8* %buf_addr.0}, i64 0, metadata !344) nounwind, !dbg !830
  %12 = ptrtoint i8* %buf_addr.0 to i64, !dbg !832
  %13 = tail call i64 @klee_get_valuel(i64 %12) nounwind, !dbg !832
  %14 = inttoptr i64 %13 to i8*, !dbg !832
  tail call void @llvm.dbg.value(metadata !{i8* %14}, i64 0, metadata !345) nounwind, !dbg !832
  %15 = icmp eq i8* %14, %buf_addr.0, !dbg !833
  %16 = zext i1 %15 to i64, !dbg !833
  tail call void @klee_assume(i64 %16) nounwind, !dbg !833
  tail call void @llvm.dbg.value(metadata !{i8* %14}, i64 0, metadata !350), !dbg !831
  tail call void @llvm.dbg.value(metadata !{i64 %size_addr.1}, i64 0, metadata !347) nounwind, !dbg !834
  %17 = tail call i64 @klee_get_valuel(i64 %size_addr.1) nounwind, !dbg !836
  tail call void @llvm.dbg.value(metadata !{i64 %17}, i64 0, metadata !348) nounwind, !dbg !836
  %18 = icmp eq i64 %17, %size_addr.1, !dbg !837
  %19 = zext i1 %18 to i64, !dbg !837
  tail call void @klee_assume(i64 %19) nounwind, !dbg !837
  tail call void @llvm.dbg.value(metadata !{i64 %17}, i64 0, metadata !351), !dbg !835
  tail call void @klee_check_memory_access(i8* %14, i64 %17) nounwind, !dbg !838
  %20 = tail call i64 (i64, ...)* @syscall(i64 79, i8* %14, i64 %17) nounwind, !dbg !839
  %21 = trunc i64 %20 to i32, !dbg !839
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !352), !dbg !839
  %22 = icmp eq i32 %21, -1, !dbg !840
  br i1 %22, label %bb7, label %bb9, !dbg !840

bb7:                                              ; preds = %bb6
  %23 = tail call i32* @__errno_location() nounwind readnone, !dbg !841
  %24 = tail call i32 @klee_get_errno() nounwind, !dbg !841
  store i32 %24, i32* %23, align 4, !dbg !841
  br label %bb9, !dbg !842

bb9:                                              ; preds = %bb6, %bb7, %bb1
  %.0 = phi i8* [ null, %bb1 ], [ null, %bb7 ], [ %14, %bb6 ]
  ret i8* %.0, !dbg !824
}

declare noalias i8* @malloc(i64) nounwind

declare void @klee_check_memory_access(i8*, i64)

define i32 @__fd_statfs(i8* %path, %struct.statfs* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !362), !dbg !843
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf}, i64 0, metadata !363), !dbg !843
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !267), !dbg !844
  %0 = load i8* %path, align 1, !dbg !846
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !268), !dbg !846
  %1 = icmp eq i8 %0, 0, !dbg !847
  br i1 %1, label %bb1, label %bb.i, !dbg !847

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !847
  %3 = load i8* %2, align 1, !dbg !847
  %4 = icmp eq i8 %3, 0, !dbg !847
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !847

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !848
  %6 = sext i8 %0 to i32, !dbg !849
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !849
  %8 = add nsw i32 %7, 65, !dbg !849
  %9 = icmp eq i32 %6, %8, !dbg !849
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !849

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !850
  %11 = zext i32 %18 to i64, !dbg !850
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !271), !dbg !850
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !851
  %13 = load %struct.stat** %12, align 8, !dbg !851
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !851
  %15 = load i64* %14, align 8, !dbg !851
  %16 = icmp eq i64 %15, 0, !dbg !851
  br i1 %16, label %bb1, label %__get_sym_file.exit, !dbg !851

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !848
  br label %bb8.i, !dbg !848

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !848
  br i1 %19, label %bb3.i, label %bb1, !dbg !848

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !850
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %20}, i64 0, metadata !364), !dbg !845
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !852
  br i1 %21, label %bb1, label %bb, !dbg !852

bb:                                               ; preds = %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str5, i64 0, i64 0)) nounwind, !dbg !853
  %22 = tail call i32* @__errno_location() nounwind readnone, !dbg !854
  store i32 2, i32* %22, align 4, !dbg !854
  br label %bb4, !dbg !855

bb1:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !354) nounwind, !dbg !856
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !344) nounwind, !dbg !858
  %23 = ptrtoint i8* %path to i64, !dbg !860
  %24 = tail call i64 @klee_get_valuel(i64 %23) nounwind, !dbg !860
  %25 = inttoptr i64 %24 to i8*, !dbg !860
  tail call void @llvm.dbg.value(metadata !{i8* %25}, i64 0, metadata !345) nounwind, !dbg !860
  %26 = icmp eq i8* %25, %path, !dbg !861
  %27 = zext i1 %26 to i64, !dbg !861
  tail call void @klee_assume(i64 %27) nounwind, !dbg !861
  tail call void @llvm.dbg.value(metadata !{i8* %25}, i64 0, metadata !355) nounwind, !dbg !859
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !357) nounwind, !dbg !862
  br label %bb.i6, !dbg !862

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.0.i = phi i8* [ %25, %bb1 ], [ %sc.1.i, %bb6.i8 ]
  %28 = phi i32 [ 0, %bb1 ], [ %40, %bb6.i8 ]
  %tmp.i = add i32 %28, -1
  %29 = load i8* %sc.0.i, align 1, !dbg !863
  %30 = and i32 %tmp.i, %28, !dbg !864
  %31 = icmp eq i32 %30, 0, !dbg !864
  br i1 %31, label %bb1.i, label %bb5.i, !dbg !864

bb1.i:                                            ; preds = %bb.i6
  switch i8 %29, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %29}, i64 0, metadata !358) nounwind, !dbg !863
  store i8 0, i8* %sc.0.i, align 1, !dbg !865
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !355) nounwind, !dbg !865
  br label %__concretize_string.exit, !dbg !865

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !866
  %32 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !866
  br label %bb6.i8, !dbg !866

bb5.i:                                            ; preds = %bb.i6
  %33 = sext i8 %29 to i64, !dbg !867
  %34 = tail call i64 @klee_get_valuel(i64 %33) nounwind, !dbg !867
  %35 = trunc i64 %34 to i8, !dbg !867
  %36 = icmp eq i8 %35, %29, !dbg !868
  %37 = zext i1 %36 to i64, !dbg !868
  tail call void @klee_assume(i64 %37) nounwind, !dbg !868
  store i8 %35, i8* %sc.0.i, align 1, !dbg !869
  %38 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !869
  %39 = icmp eq i8 %35, 0, !dbg !870
  br i1 %39, label %__concretize_string.exit, label %bb6.i8, !dbg !870

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.1.i = phi i8* [ %32, %bb4.i7 ], [ %38, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %40 = add i32 %28, 1, !dbg !862
  br label %bb.i6, !dbg !862

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %41 = tail call i64 (i64, ...)* @syscall(i64 137, i8* %path, %struct.statfs* %buf) nounwind, !dbg !857
  %42 = trunc i64 %41 to i32, !dbg !857
  tail call void @llvm.dbg.value(metadata !{i32 %42}, i64 0, metadata !366), !dbg !857
  %43 = icmp eq i32 %42, -1, !dbg !871
  br i1 %43, label %bb2, label %bb4, !dbg !871

bb2:                                              ; preds = %__concretize_string.exit
  %44 = tail call i32* @__errno_location() nounwind readnone, !dbg !872
  %45 = tail call i32 @klee_get_errno() nounwind, !dbg !872
  store i32 %45, i32* %44, align 4, !dbg !872
  br label %bb4, !dbg !872

bb4:                                              ; preds = %__concretize_string.exit, %bb2, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb2 ], [ %42, %__concretize_string.exit ]
  ret i32 %.0, !dbg !855
}

define i32 @lchown(i8* %path, i32 %owner, i32 %group) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !368), !dbg !873
  tail call void @llvm.dbg.value(metadata !{i32 %owner}, i64 0, metadata !369), !dbg !873
  tail call void @llvm.dbg.value(metadata !{i32 %group}, i64 0, metadata !370), !dbg !873
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !267), !dbg !874
  %0 = load i8* %path, align 1, !dbg !876
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !268), !dbg !876
  %1 = icmp eq i8 %0, 0, !dbg !877
  br i1 %1, label %bb1, label %bb.i, !dbg !877

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !877
  %3 = load i8* %2, align 1, !dbg !877
  %4 = icmp eq i8 %3, 0, !dbg !877
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !877

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !878
  %6 = sext i8 %0 to i32, !dbg !879
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !879
  %8 = add nsw i32 %7, 65, !dbg !879
  %9 = icmp eq i32 %6, %8, !dbg !879
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !879

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !880
  %11 = zext i32 %18 to i64, !dbg !880
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !271), !dbg !880
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !881
  %13 = load %struct.stat** %12, align 8, !dbg !881
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !881
  %15 = load i64* %14, align 8, !dbg !881
  %16 = icmp eq i64 %15, 0, !dbg !881
  br i1 %16, label %bb1, label %__get_sym_file.exit, !dbg !881

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !878
  br label %bb8.i, !dbg !878

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !878
  br i1 %19, label %bb3.i, label %bb1, !dbg !878

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !880
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %20}, i64 0, metadata !371), !dbg !875
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !882
  br i1 %21, label %bb1, label %bb, !dbg !882

bb:                                               ; preds = %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !794, i64 0, metadata !298) nounwind, !dbg !883
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !299) nounwind, !dbg !883
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !300) nounwind, !dbg !883
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str2, i64 0, i64 0)) nounwind, !dbg !885
  %22 = tail call i32* @__errno_location() nounwind readnone, !dbg !886
  store i32 1, i32* %22, align 4, !dbg !886
  br label %bb4, !dbg !884

bb1:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !354) nounwind, !dbg !887
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !344) nounwind, !dbg !889
  %23 = ptrtoint i8* %path to i64, !dbg !891
  %24 = tail call i64 @klee_get_valuel(i64 %23) nounwind, !dbg !891
  %25 = inttoptr i64 %24 to i8*, !dbg !891
  tail call void @llvm.dbg.value(metadata !{i8* %25}, i64 0, metadata !345) nounwind, !dbg !891
  %26 = icmp eq i8* %25, %path, !dbg !892
  %27 = zext i1 %26 to i64, !dbg !892
  tail call void @klee_assume(i64 %27) nounwind, !dbg !892
  tail call void @llvm.dbg.value(metadata !{i8* %25}, i64 0, metadata !355) nounwind, !dbg !890
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !357) nounwind, !dbg !893
  br label %bb.i6, !dbg !893

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.0.i = phi i8* [ %25, %bb1 ], [ %sc.1.i, %bb6.i8 ]
  %28 = phi i32 [ 0, %bb1 ], [ %40, %bb6.i8 ]
  %tmp.i = add i32 %28, -1
  %29 = load i8* %sc.0.i, align 1, !dbg !894
  %30 = and i32 %tmp.i, %28, !dbg !895
  %31 = icmp eq i32 %30, 0, !dbg !895
  br i1 %31, label %bb1.i, label %bb5.i, !dbg !895

bb1.i:                                            ; preds = %bb.i6
  switch i8 %29, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %29}, i64 0, metadata !358) nounwind, !dbg !894
  store i8 0, i8* %sc.0.i, align 1, !dbg !896
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !355) nounwind, !dbg !896
  br label %__concretize_string.exit, !dbg !896

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !897
  %32 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !897
  br label %bb6.i8, !dbg !897

bb5.i:                                            ; preds = %bb.i6
  %33 = sext i8 %29 to i64, !dbg !898
  %34 = tail call i64 @klee_get_valuel(i64 %33) nounwind, !dbg !898
  %35 = trunc i64 %34 to i8, !dbg !898
  %36 = icmp eq i8 %35, %29, !dbg !899
  %37 = zext i1 %36 to i64, !dbg !899
  tail call void @klee_assume(i64 %37) nounwind, !dbg !899
  store i8 %35, i8* %sc.0.i, align 1, !dbg !900
  %38 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !900
  %39 = icmp eq i8 %35, 0, !dbg !901
  br i1 %39, label %__concretize_string.exit, label %bb6.i8, !dbg !901

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.1.i = phi i8* [ %32, %bb4.i7 ], [ %38, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %40 = add i32 %28, 1, !dbg !893
  br label %bb.i6, !dbg !893

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %41 = tail call i64 (i64, ...)* @syscall(i64 92, i8* %path, i32 %owner, i32 %group) nounwind, !dbg !888
  %42 = trunc i64 %41 to i32, !dbg !888
  tail call void @llvm.dbg.value(metadata !{i32 %42}, i64 0, metadata !373), !dbg !888
  %43 = icmp eq i32 %42, -1, !dbg !902
  br i1 %43, label %bb2, label %bb4, !dbg !902

bb2:                                              ; preds = %__concretize_string.exit
  %44 = tail call i32* @__errno_location() nounwind readnone, !dbg !903
  %45 = tail call i32 @klee_get_errno() nounwind, !dbg !903
  store i32 %45, i32* %44, align 4, !dbg !903
  br label %bb4, !dbg !903

bb4:                                              ; preds = %__concretize_string.exit, %bb2, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb2 ], [ %42, %__concretize_string.exit ]
  ret i32 %.0, !dbg !884
}

define i32 @chown(i8* %path, i32 %owner, i32 %group) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !375), !dbg !904
  tail call void @llvm.dbg.value(metadata !{i32 %owner}, i64 0, metadata !376), !dbg !904
  tail call void @llvm.dbg.value(metadata !{i32 %group}, i64 0, metadata !377), !dbg !904
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !267), !dbg !905
  %0 = load i8* %path, align 1, !dbg !907
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !268), !dbg !907
  %1 = icmp eq i8 %0, 0, !dbg !908
  br i1 %1, label %bb1, label %bb.i, !dbg !908

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !908
  %3 = load i8* %2, align 1, !dbg !908
  %4 = icmp eq i8 %3, 0, !dbg !908
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !908

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !909
  %6 = sext i8 %0 to i32, !dbg !910
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !910
  %8 = add nsw i32 %7, 65, !dbg !910
  %9 = icmp eq i32 %6, %8, !dbg !910
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !910

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !911
  %11 = zext i32 %18 to i64, !dbg !911
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !271), !dbg !911
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !912
  %13 = load %struct.stat** %12, align 8, !dbg !912
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !912
  %15 = load i64* %14, align 8, !dbg !912
  %16 = icmp eq i64 %15, 0, !dbg !912
  br i1 %16, label %bb1, label %__get_sym_file.exit, !dbg !912

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !909
  br label %bb8.i, !dbg !909

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !909
  br i1 %19, label %bb3.i, label %bb1, !dbg !909

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !911
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %20}, i64 0, metadata !378), !dbg !906
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !913
  br i1 %21, label %bb1, label %bb, !dbg !913

bb:                                               ; preds = %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !794, i64 0, metadata !298) nounwind, !dbg !914
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !299) nounwind, !dbg !914
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !300) nounwind, !dbg !914
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str2, i64 0, i64 0)) nounwind, !dbg !916
  %22 = tail call i32* @__errno_location() nounwind readnone, !dbg !917
  store i32 1, i32* %22, align 4, !dbg !917
  br label %bb4, !dbg !915

bb1:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !354) nounwind, !dbg !918
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !344) nounwind, !dbg !920
  %23 = ptrtoint i8* %path to i64, !dbg !922
  %24 = tail call i64 @klee_get_valuel(i64 %23) nounwind, !dbg !922
  %25 = inttoptr i64 %24 to i8*, !dbg !922
  tail call void @llvm.dbg.value(metadata !{i8* %25}, i64 0, metadata !345) nounwind, !dbg !922
  %26 = icmp eq i8* %25, %path, !dbg !923
  %27 = zext i1 %26 to i64, !dbg !923
  tail call void @klee_assume(i64 %27) nounwind, !dbg !923
  tail call void @llvm.dbg.value(metadata !{i8* %25}, i64 0, metadata !355) nounwind, !dbg !921
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !357) nounwind, !dbg !924
  br label %bb.i6, !dbg !924

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.0.i = phi i8* [ %25, %bb1 ], [ %sc.1.i, %bb6.i8 ]
  %28 = phi i32 [ 0, %bb1 ], [ %40, %bb6.i8 ]
  %tmp.i = add i32 %28, -1
  %29 = load i8* %sc.0.i, align 1, !dbg !925
  %30 = and i32 %tmp.i, %28, !dbg !926
  %31 = icmp eq i32 %30, 0, !dbg !926
  br i1 %31, label %bb1.i, label %bb5.i, !dbg !926

bb1.i:                                            ; preds = %bb.i6
  switch i8 %29, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %29}, i64 0, metadata !358) nounwind, !dbg !925
  store i8 0, i8* %sc.0.i, align 1, !dbg !927
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !355) nounwind, !dbg !927
  br label %__concretize_string.exit, !dbg !927

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !928
  %32 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !928
  br label %bb6.i8, !dbg !928

bb5.i:                                            ; preds = %bb.i6
  %33 = sext i8 %29 to i64, !dbg !929
  %34 = tail call i64 @klee_get_valuel(i64 %33) nounwind, !dbg !929
  %35 = trunc i64 %34 to i8, !dbg !929
  %36 = icmp eq i8 %35, %29, !dbg !930
  %37 = zext i1 %36 to i64, !dbg !930
  tail call void @klee_assume(i64 %37) nounwind, !dbg !930
  store i8 %35, i8* %sc.0.i, align 1, !dbg !931
  %38 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !931
  %39 = icmp eq i8 %35, 0, !dbg !932
  br i1 %39, label %__concretize_string.exit, label %bb6.i8, !dbg !932

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.1.i = phi i8* [ %32, %bb4.i7 ], [ %38, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %40 = add i32 %28, 1, !dbg !924
  br label %bb.i6, !dbg !924

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %41 = tail call i64 (i64, ...)* @syscall(i64 92, i8* %path, i32 %owner, i32 %group) nounwind, !dbg !919
  %42 = trunc i64 %41 to i32, !dbg !919
  tail call void @llvm.dbg.value(metadata !{i32 %42}, i64 0, metadata !380), !dbg !919
  %43 = icmp eq i32 %42, -1, !dbg !933
  br i1 %43, label %bb2, label %bb4, !dbg !933

bb2:                                              ; preds = %__concretize_string.exit
  %44 = tail call i32* @__errno_location() nounwind readnone, !dbg !934
  %45 = tail call i32 @klee_get_errno() nounwind, !dbg !934
  store i32 %45, i32* %44, align 4, !dbg !934
  br label %bb4, !dbg !934

bb4:                                              ; preds = %__concretize_string.exit, %bb2, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb2 ], [ %42, %__concretize_string.exit ]
  ret i32 %.0, !dbg !915
}

define i32 @chdir(i8* %path) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !382), !dbg !935
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !267), !dbg !936
  %0 = load i8* %path, align 1, !dbg !938
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !268), !dbg !938
  %1 = icmp eq i8 %0, 0, !dbg !939
  br i1 %1, label %bb1, label %bb.i, !dbg !939

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !939
  %3 = load i8* %2, align 1, !dbg !939
  %4 = icmp eq i8 %3, 0, !dbg !939
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !939

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !940
  %6 = sext i8 %0 to i32, !dbg !941
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !941
  %8 = add nsw i32 %7, 65, !dbg !941
  %9 = icmp eq i32 %6, %8, !dbg !941
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !941

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !942
  %11 = zext i32 %18 to i64, !dbg !942
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !271), !dbg !942
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !943
  %13 = load %struct.stat** %12, align 8, !dbg !943
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !943
  %15 = load i64* %14, align 8, !dbg !943
  %16 = icmp eq i64 %15, 0, !dbg !943
  br i1 %16, label %bb1, label %__get_sym_file.exit, !dbg !943

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !940
  br label %bb8.i, !dbg !940

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !940
  br i1 %19, label %bb3.i, label %bb1, !dbg !940

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !942
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %20}, i64 0, metadata !383), !dbg !937
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !944
  br i1 %21, label %bb1, label %bb, !dbg !944

bb:                                               ; preds = %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str5, i64 0, i64 0)) nounwind, !dbg !945
  %22 = tail call i32* @__errno_location() nounwind readnone, !dbg !946
  store i32 2, i32* %22, align 4, !dbg !946
  br label %bb4, !dbg !947

bb1:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !354) nounwind, !dbg !948
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !344) nounwind, !dbg !950
  %23 = ptrtoint i8* %path to i64, !dbg !952
  %24 = tail call i64 @klee_get_valuel(i64 %23) nounwind, !dbg !952
  %25 = inttoptr i64 %24 to i8*, !dbg !952
  tail call void @llvm.dbg.value(metadata !{i8* %25}, i64 0, metadata !345) nounwind, !dbg !952
  %26 = icmp eq i8* %25, %path, !dbg !953
  %27 = zext i1 %26 to i64, !dbg !953
  tail call void @klee_assume(i64 %27) nounwind, !dbg !953
  tail call void @llvm.dbg.value(metadata !{i8* %25}, i64 0, metadata !355) nounwind, !dbg !951
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !357) nounwind, !dbg !954
  br label %bb.i6, !dbg !954

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.0.i = phi i8* [ %25, %bb1 ], [ %sc.1.i, %bb6.i8 ]
  %28 = phi i32 [ 0, %bb1 ], [ %40, %bb6.i8 ]
  %tmp.i = add i32 %28, -1
  %29 = load i8* %sc.0.i, align 1, !dbg !955
  %30 = and i32 %tmp.i, %28, !dbg !956
  %31 = icmp eq i32 %30, 0, !dbg !956
  br i1 %31, label %bb1.i, label %bb5.i, !dbg !956

bb1.i:                                            ; preds = %bb.i6
  switch i8 %29, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %29}, i64 0, metadata !358) nounwind, !dbg !955
  store i8 0, i8* %sc.0.i, align 1, !dbg !957
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !355) nounwind, !dbg !957
  br label %__concretize_string.exit, !dbg !957

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !958
  %32 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !958
  br label %bb6.i8, !dbg !958

bb5.i:                                            ; preds = %bb.i6
  %33 = sext i8 %29 to i64, !dbg !959
  %34 = tail call i64 @klee_get_valuel(i64 %33) nounwind, !dbg !959
  %35 = trunc i64 %34 to i8, !dbg !959
  %36 = icmp eq i8 %35, %29, !dbg !960
  %37 = zext i1 %36 to i64, !dbg !960
  tail call void @klee_assume(i64 %37) nounwind, !dbg !960
  store i8 %35, i8* %sc.0.i, align 1, !dbg !961
  %38 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !961
  %39 = icmp eq i8 %35, 0, !dbg !962
  br i1 %39, label %__concretize_string.exit, label %bb6.i8, !dbg !962

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.1.i = phi i8* [ %32, %bb4.i7 ], [ %38, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %40 = add i32 %28, 1, !dbg !954
  br label %bb.i6, !dbg !954

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %41 = tail call i64 (i64, ...)* @syscall(i64 80, i8* %path) nounwind, !dbg !949
  %42 = trunc i64 %41 to i32, !dbg !949
  tail call void @llvm.dbg.value(metadata !{i32 %42}, i64 0, metadata !385), !dbg !949
  %43 = icmp eq i32 %42, -1, !dbg !963
  br i1 %43, label %bb2, label %bb4, !dbg !963

bb2:                                              ; preds = %__concretize_string.exit
  %44 = tail call i32* @__errno_location() nounwind readnone, !dbg !964
  %45 = tail call i32 @klee_get_errno() nounwind, !dbg !964
  store i32 %45, i32* %44, align 4, !dbg !964
  br label %bb4, !dbg !964

bb4:                                              ; preds = %__concretize_string.exit, %bb2, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb2 ], [ %42, %__concretize_string.exit ]
  ret i32 %.0, !dbg !947
}

define i32 @utimes(i8* %path, %struct.timespec* %times) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !387), !dbg !965
  tail call void @llvm.dbg.value(metadata !{%struct.timespec* %times}, i64 0, metadata !388), !dbg !965
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !267), !dbg !966
  %0 = load i8* %path, align 1, !dbg !968
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !268), !dbg !968
  %1 = icmp eq i8 %0, 0, !dbg !969
  br i1 %1, label %bb1, label %bb.i, !dbg !969

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !969
  %3 = load i8* %2, align 1, !dbg !969
  %4 = icmp eq i8 %3, 0, !dbg !969
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !969

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !970
  %6 = sext i8 %0 to i32, !dbg !971
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !971
  %8 = add nsw i32 %7, 65, !dbg !971
  %9 = icmp eq i32 %6, %8, !dbg !971
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !971

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !972
  %11 = zext i32 %18 to i64, !dbg !972
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !271), !dbg !972
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !973
  %13 = load %struct.stat** %12, align 8, !dbg !973
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !973
  %15 = load i64* %14, align 8, !dbg !973
  %16 = icmp eq i64 %15, 0, !dbg !973
  br i1 %16, label %bb1, label %__get_sym_file.exit, !dbg !973

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !970
  br label %bb8.i, !dbg !970

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !970
  br i1 %19, label %bb3.i, label %bb1, !dbg !970

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !972
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %20}, i64 0, metadata !389), !dbg !967
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !974
  br i1 %21, label %bb1, label %bb, !dbg !974

bb:                                               ; preds = %__get_sym_file.exit
  %22 = getelementptr inbounds %struct.timespec* %times, i64 0, i32 0, !dbg !975
  %23 = load i64* %22, align 8, !dbg !975
  %24 = getelementptr inbounds %struct.stat* %13, i64 0, i32 11, i32 0, !dbg !975
  store i64 %23, i64* %24, align 8, !dbg !975
  %25 = load %struct.stat** %12, align 8, !dbg !976
  %26 = getelementptr inbounds %struct.timespec* %times, i64 1, i32 0, !dbg !976
  %27 = load i64* %26, align 8, !dbg !976
  %28 = getelementptr inbounds %struct.stat* %25, i64 0, i32 12, i32 0, !dbg !976
  store i64 %27, i64* %28, align 8, !dbg !976
  %29 = load %struct.stat** %12, align 8, !dbg !977
  %30 = load i64* %22, align 8, !dbg !977
  %31 = mul nsw i64 %30, 1000000000, !dbg !977
  %32 = getelementptr inbounds %struct.stat* %29, i64 0, i32 11, i32 1, !dbg !977
  store i64 %31, i64* %32, align 8, !dbg !977
  %33 = load %struct.stat** %12, align 8, !dbg !978
  %34 = load i64* %26, align 8, !dbg !978
  %35 = mul nsw i64 %34, 1000000000, !dbg !978
  %36 = getelementptr inbounds %struct.stat* %33, i64 0, i32 12, i32 1, !dbg !978
  store i64 %35, i64* %36, align 8, !dbg !978
  br label %bb4, !dbg !979

bb1:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !354) nounwind, !dbg !980
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !344) nounwind, !dbg !982
  %37 = ptrtoint i8* %path to i64, !dbg !984
  %38 = tail call i64 @klee_get_valuel(i64 %37) nounwind, !dbg !984
  %39 = inttoptr i64 %38 to i8*, !dbg !984
  tail call void @llvm.dbg.value(metadata !{i8* %39}, i64 0, metadata !345) nounwind, !dbg !984
  %40 = icmp eq i8* %39, %path, !dbg !985
  %41 = zext i1 %40 to i64, !dbg !985
  tail call void @klee_assume(i64 %41) nounwind, !dbg !985
  tail call void @llvm.dbg.value(metadata !{i8* %39}, i64 0, metadata !355) nounwind, !dbg !983
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !357) nounwind, !dbg !986
  br label %bb.i6, !dbg !986

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.0.i = phi i8* [ %39, %bb1 ], [ %sc.1.i, %bb6.i8 ]
  %42 = phi i32 [ 0, %bb1 ], [ %54, %bb6.i8 ]
  %tmp.i = add i32 %42, -1
  %43 = load i8* %sc.0.i, align 1, !dbg !987
  %44 = and i32 %tmp.i, %42, !dbg !988
  %45 = icmp eq i32 %44, 0, !dbg !988
  br i1 %45, label %bb1.i, label %bb5.i, !dbg !988

bb1.i:                                            ; preds = %bb.i6
  switch i8 %43, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %43}, i64 0, metadata !358) nounwind, !dbg !987
  store i8 0, i8* %sc.0.i, align 1, !dbg !989
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !355) nounwind, !dbg !989
  br label %__concretize_string.exit, !dbg !989

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !990
  %46 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !990
  br label %bb6.i8, !dbg !990

bb5.i:                                            ; preds = %bb.i6
  %47 = sext i8 %43 to i64, !dbg !991
  %48 = tail call i64 @klee_get_valuel(i64 %47) nounwind, !dbg !991
  %49 = trunc i64 %48 to i8, !dbg !991
  %50 = icmp eq i8 %49, %43, !dbg !992
  %51 = zext i1 %50 to i64, !dbg !992
  tail call void @klee_assume(i64 %51) nounwind, !dbg !992
  store i8 %49, i8* %sc.0.i, align 1, !dbg !993
  %52 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !993
  %53 = icmp eq i8 %49, 0, !dbg !994
  br i1 %53, label %__concretize_string.exit, label %bb6.i8, !dbg !994

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.1.i = phi i8* [ %46, %bb4.i7 ], [ %52, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %54 = add i32 %42, 1, !dbg !986
  br label %bb.i6, !dbg !986

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %55 = tail call i64 (i64, ...)* @syscall(i64 235, i8* %path, %struct.timespec* %times) nounwind, !dbg !981
  %56 = trunc i64 %55 to i32, !dbg !981
  tail call void @llvm.dbg.value(metadata !{i32 %56}, i64 0, metadata !391), !dbg !981
  %57 = icmp eq i32 %56, -1, !dbg !995
  br i1 %57, label %bb2, label %bb4, !dbg !995

bb2:                                              ; preds = %__concretize_string.exit
  %58 = tail call i32* @__errno_location() nounwind readnone, !dbg !996
  %59 = tail call i32 @klee_get_errno() nounwind, !dbg !996
  store i32 %59, i32* %58, align 4, !dbg !996
  br label %bb4, !dbg !996

bb4:                                              ; preds = %__concretize_string.exit, %bb2, %bb
  %.0 = phi i32 [ 0, %bb ], [ -1, %bb2 ], [ %56, %__concretize_string.exit ]
  ret i32 %.0, !dbg !979
}

define i32 @futimesat(i32 %fd, i8* %path, %struct.timespec* %times) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !392), !dbg !997
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !393), !dbg !997
  tail call void @llvm.dbg.value(metadata !{%struct.timespec* %times}, i64 0, metadata !394), !dbg !997
  %0 = icmp eq i32 %fd, -100, !dbg !998
  br i1 %0, label %bb5, label %bb, !dbg !998

bb:                                               ; preds = %entry
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !273), !dbg !999
  %1 = icmp ult i32 %fd, 32, !dbg !1001
  br i1 %1, label %bb.i, label %bb1, !dbg !1001

bb.i:                                             ; preds = %bb
  %2 = sext i32 %fd to i64, !dbg !1002
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !1002
  %3 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %2, i32 1, !dbg !1003
  %4 = load i32* %3, align 4, !dbg !1003
  %5 = and i32 %4, 1
  %toBool.i = icmp eq i32 %5, 0, !dbg !1003
  br i1 %toBool.i, label %bb1, label %__get_file.exit, !dbg !1003

__get_file.exit:                                  ; preds = %bb.i
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %2, !dbg !1002
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %6}, i64 0, metadata !397), !dbg !1000
  %7 = icmp eq %struct.exe_file_t* %6, null, !dbg !1004
  br i1 %7, label %bb1, label %bb2, !dbg !1004

bb1:                                              ; preds = %bb, %bb.i, %__get_file.exit
  %8 = tail call i32* @__errno_location() nounwind readnone, !dbg !1005
  store i32 9, i32* %8, align 4, !dbg !1005
  br label %bb13, !dbg !1006

bb2:                                              ; preds = %__get_file.exit
  %9 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %2, i32 3, !dbg !1007
  %10 = load %struct.exe_disk_file_t** %9, align 8, !dbg !1007
  %11 = icmp eq %struct.exe_disk_file_t* %10, null, !dbg !1007
  br i1 %11, label %bb4, label %bb3, !dbg !1007

bb3:                                              ; preds = %bb2
  tail call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str6, i64 0, i64 0)) nounwind, !dbg !1008
  %12 = tail call i32* @__errno_location() nounwind readnone, !dbg !1009
  store i32 2, i32* %12, align 4, !dbg !1009
  br label %bb13, !dbg !1010

bb4:                                              ; preds = %bb2
  %13 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %2, i32 0, !dbg !1011
  %14 = load i32* %13, align 8, !dbg !1011
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !392), !dbg !1011
  %phitmp = sext i32 %14 to i64
  br label %bb5, !dbg !1011

bb5:                                              ; preds = %entry, %bb4
  %fd_addr.0 = phi i64 [ %phitmp, %bb4 ], [ -100, %entry ]
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !267), !dbg !1012
  %15 = load i8* %path, align 1, !dbg !1014
  tail call void @llvm.dbg.value(metadata !{i8 %15}, i64 0, metadata !268), !dbg !1014
  %16 = icmp eq i8 %15, 0, !dbg !1015
  br i1 %16, label %bb7, label %bb.i17, !dbg !1015

bb.i17:                                           ; preds = %bb5
  %17 = getelementptr inbounds i8* %path, i64 1, !dbg !1015
  %18 = load i8* %17, align 1, !dbg !1015
  %19 = icmp eq i8 %18, 0, !dbg !1015
  br i1 %19, label %bb8.preheader.i, label %bb7, !dbg !1015

bb8.preheader.i:                                  ; preds = %bb.i17
  %20 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1016
  %21 = sext i8 %15 to i32, !dbg !1017
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %33, 24
  %22 = ashr exact i32 %sext.i, 24, !dbg !1017
  %23 = add nsw i32 %22, 65, !dbg !1017
  %24 = icmp eq i32 %21, %23, !dbg !1017
  br i1 %24, label %bb4.i18, label %bb7.i, !dbg !1017

bb4.i18:                                          ; preds = %bb3.i
  %25 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1018
  %26 = zext i32 %33 to i64, !dbg !1018
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !271), !dbg !1018
  %27 = getelementptr inbounds %struct.exe_disk_file_t* %25, i64 %26, i32 2, !dbg !1019
  %28 = load %struct.stat** %27, align 8, !dbg !1019
  %29 = getelementptr inbounds %struct.stat* %28, i64 0, i32 1, !dbg !1019
  %30 = load i64* %29, align 8, !dbg !1019
  %31 = icmp eq i64 %30, 0, !dbg !1019
  br i1 %31, label %bb7, label %__get_sym_file.exit, !dbg !1019

bb7.i:                                            ; preds = %bb3.i
  %32 = add i32 %33, 1, !dbg !1016
  br label %bb8.i, !dbg !1016

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %33 = phi i32 [ %32, %bb7.i ], [ 0, %bb8.preheader.i ]
  %34 = icmp ugt i32 %20, %33, !dbg !1016
  br i1 %34, label %bb3.i, label %bb7, !dbg !1016

__get_sym_file.exit:                              ; preds = %bb4.i18
  %35 = getelementptr inbounds %struct.exe_disk_file_t* %25, i64 %26, !dbg !1018
  %36 = icmp eq %struct.exe_disk_file_t* %35, null, !dbg !1013
  br i1 %36, label %bb7, label %bb6, !dbg !1013

bb6:                                              ; preds = %__get_sym_file.exit
  %37 = tail call i32 @utimes(i8* %path, %struct.timespec* %times) nounwind, !dbg !1020
  br label %bb13, !dbg !1020

bb7:                                              ; preds = %bb8.i, %bb4.i18, %bb5, %bb.i17, %__get_sym_file.exit
  %38 = icmp eq i8* %path, null, !dbg !1021
  br i1 %38, label %bb10, label %bb8, !dbg !1021

bb8:                                              ; preds = %bb7
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !354) nounwind, !dbg !1022
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !344) nounwind, !dbg !1023
  %39 = ptrtoint i8* %path to i64, !dbg !1025
  %40 = tail call i64 @klee_get_valuel(i64 %39) nounwind, !dbg !1025
  %41 = inttoptr i64 %40 to i8*, !dbg !1025
  tail call void @llvm.dbg.value(metadata !{i8* %41}, i64 0, metadata !345) nounwind, !dbg !1025
  %42 = icmp eq i8* %41, %path, !dbg !1026
  %43 = zext i1 %42 to i64, !dbg !1026
  tail call void @klee_assume(i64 %43) nounwind, !dbg !1026
  tail call void @llvm.dbg.value(metadata !{i8* %41}, i64 0, metadata !355) nounwind, !dbg !1024
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !357) nounwind, !dbg !1027
  br label %bb.i15, !dbg !1027

bb.i15:                                           ; preds = %bb6.i, %bb8
  %sc.0.i = phi i8* [ %41, %bb8 ], [ %sc.1.i, %bb6.i ]
  %44 = phi i32 [ 0, %bb8 ], [ %56, %bb6.i ]
  %tmp.i = add i32 %44, -1
  %45 = load i8* %sc.0.i, align 1, !dbg !1028
  %46 = and i32 %tmp.i, %44, !dbg !1029
  %47 = icmp eq i32 %46, 0, !dbg !1029
  br i1 %47, label %bb1.i16, label %bb5.i, !dbg !1029

bb1.i16:                                          ; preds = %bb.i15
  switch i8 %45, label %bb6.i [
    i8 0, label %bb2.i
    i8 47, label %bb4.i
  ]

bb2.i:                                            ; preds = %bb1.i16
  tail call void @llvm.dbg.value(metadata !{i8 %45}, i64 0, metadata !358) nounwind, !dbg !1028
  store i8 0, i8* %sc.0.i, align 1, !dbg !1030
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !355) nounwind, !dbg !1030
  br label %bb10, !dbg !1030

bb4.i:                                            ; preds = %bb1.i16
  store i8 47, i8* %sc.0.i, align 1, !dbg !1031
  %48 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1031
  br label %bb6.i, !dbg !1031

bb5.i:                                            ; preds = %bb.i15
  %49 = sext i8 %45 to i64, !dbg !1032
  %50 = tail call i64 @klee_get_valuel(i64 %49) nounwind, !dbg !1032
  %51 = trunc i64 %50 to i8, !dbg !1032
  %52 = icmp eq i8 %51, %45, !dbg !1033
  %53 = zext i1 %52 to i64, !dbg !1033
  tail call void @klee_assume(i64 %53) nounwind, !dbg !1033
  store i8 %51, i8* %sc.0.i, align 1, !dbg !1034
  %54 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1034
  %55 = icmp eq i8 %51, 0, !dbg !1035
  br i1 %55, label %bb10, label %bb6.i, !dbg !1035

bb6.i:                                            ; preds = %bb5.i, %bb4.i, %bb1.i16
  %sc.1.i = phi i8* [ %48, %bb4.i ], [ %54, %bb5.i ], [ %sc.0.i, %bb1.i16 ]
  %56 = add i32 %44, 1, !dbg !1027
  br label %bb.i15, !dbg !1027

bb10:                                             ; preds = %bb5.i, %bb2.i, %bb7
  %iftmp.30.0 = phi i8* [ null, %bb7 ], [ %path, %bb2.i ], [ %path, %bb5.i ]
  %57 = tail call i64 (i64, ...)* @syscall(i64 261, i64 %fd_addr.0, i8* %iftmp.30.0, %struct.timespec* %times) nounwind, !dbg !1021
  %58 = trunc i64 %57 to i32, !dbg !1021
  tail call void @llvm.dbg.value(metadata !{i32 %58}, i64 0, metadata !395), !dbg !1021
  %59 = icmp eq i32 %58, -1, !dbg !1036
  br i1 %59, label %bb11, label %bb13, !dbg !1036

bb11:                                             ; preds = %bb10
  %60 = tail call i32* @__errno_location() nounwind readnone, !dbg !1037
  %61 = tail call i32 @klee_get_errno() nounwind, !dbg !1037
  store i32 %61, i32* %60, align 4, !dbg !1037
  br label %bb13, !dbg !1037

bb13:                                             ; preds = %bb10, %bb11, %bb6, %bb3, %bb1
  %.0 = phi i32 [ -1, %bb1 ], [ -1, %bb3 ], [ %37, %bb6 ], [ -1, %bb11 ], [ %58, %bb10 ]
  ret i32 %.0, !dbg !1006
}

define i32 @select(i32 %nfds, %struct.fd_set* %read, %struct.fd_set* %write, %struct.fd_set* %except, %struct.timespec* nocapture %timeout) nounwind {
entry:
  %in_read = alloca %struct.fd_set, align 8
  %in_write = alloca %struct.fd_set, align 8
  %in_except = alloca %struct.fd_set, align 8
  %os_read = alloca %struct.fd_set, align 8
  %os_write = alloca %struct.fd_set, align 8
  %os_except = alloca %struct.fd_set, align 8
  %tv = alloca %struct.timespec, align 8
  call void @llvm.dbg.value(metadata !{i32 %nfds}, i64 0, metadata !405), !dbg !1038
  call void @llvm.dbg.value(metadata !{%struct.fd_set* %read}, i64 0, metadata !406), !dbg !1038
  call void @llvm.dbg.value(metadata !{%struct.fd_set* %write}, i64 0, metadata !407), !dbg !1038
  call void @llvm.dbg.value(metadata !{%struct.fd_set* %except}, i64 0, metadata !408), !dbg !1039
  call void @llvm.dbg.value(metadata !{%struct.timespec* %timeout}, i64 0, metadata !409), !dbg !1039
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %in_read}, metadata !410), !dbg !1040
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %in_write}, metadata !412), !dbg !1040
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %in_except}, metadata !413), !dbg !1040
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %os_read}, metadata !414), !dbg !1040
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %os_write}, metadata !415), !dbg !1040
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %os_except}, metadata !416), !dbg !1040
  call void @llvm.dbg.value(metadata !625, i64 0, metadata !418), !dbg !1041
  call void @llvm.dbg.value(metadata !625, i64 0, metadata !419), !dbg !1041
  %0 = icmp eq %struct.fd_set* %read, null, !dbg !1042
  %in_read3 = bitcast %struct.fd_set* %in_read to i8*, !dbg !1043
  br i1 %0, label %bb2, label %bb, !dbg !1042

bb:                                               ; preds = %entry
  %1 = bitcast %struct.fd_set* %read to i8*, !dbg !1044
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %in_read3, i8* %1, i64 128, i32 8, i1 false), !dbg !1044
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 128, i32 8, i1 false), !dbg !1045
  br label %bb4, !dbg !1045

bb2:                                              ; preds = %entry
  call void @llvm.memset.p0i8.i64(i8* %in_read3, i8 0, i64 128, i32 8, i1 false), !dbg !1043
  br label %bb4, !dbg !1043

bb4:                                              ; preds = %bb2, %bb
  %2 = icmp eq %struct.fd_set* %write, null, !dbg !1046
  %in_write8 = bitcast %struct.fd_set* %in_write to i8*, !dbg !1047
  br i1 %2, label %bb7, label %bb5, !dbg !1046

bb5:                                              ; preds = %bb4
  %3 = bitcast %struct.fd_set* %write to i8*, !dbg !1048
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %in_write8, i8* %3, i64 128, i32 8, i1 false), !dbg !1048
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 128, i32 8, i1 false), !dbg !1049
  br label %bb9, !dbg !1049

bb7:                                              ; preds = %bb4
  call void @llvm.memset.p0i8.i64(i8* %in_write8, i8 0, i64 128, i32 8, i1 false), !dbg !1047
  br label %bb9, !dbg !1047

bb9:                                              ; preds = %bb7, %bb5
  %4 = icmp eq %struct.fd_set* %except, null, !dbg !1050
  %in_except13 = bitcast %struct.fd_set* %in_except to i8*, !dbg !1051
  br i1 %4, label %bb12, label %bb10, !dbg !1050

bb10:                                             ; preds = %bb9
  %5 = bitcast %struct.fd_set* %except to i8*, !dbg !1052
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %in_except13, i8* %5, i64 128, i32 8, i1 false), !dbg !1052
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 128, i32 8, i1 false), !dbg !1053
  br label %bb14, !dbg !1053

bb12:                                             ; preds = %bb9
  call void @llvm.memset.p0i8.i64(i8* %in_except13, i8 0, i64 128, i32 8, i1 false), !dbg !1051
  br label %bb14, !dbg !1051

bb14:                                             ; preds = %bb12, %bb10
  %os_read15 = bitcast %struct.fd_set* %os_read to i8*, !dbg !1054
  call void @llvm.memset.p0i8.i64(i8* %os_read15, i8 0, i64 128, i32 8, i1 false), !dbg !1054
  %os_write16 = bitcast %struct.fd_set* %os_write to i8*, !dbg !1055
  call void @llvm.memset.p0i8.i64(i8* %os_write16, i8 0, i64 128, i32 8, i1 false), !dbg !1055
  %os_except17 = bitcast %struct.fd_set* %os_except to i8*, !dbg !1056
  call void @llvm.memset.p0i8.i64(i8* %os_except17, i8 0, i64 128, i32 8, i1 false), !dbg !1056
  call void @llvm.dbg.value(metadata !625, i64 0, metadata !417), !dbg !1057
  br label %bb40, !dbg !1057

bb18:                                             ; preds = %bb40
  %6 = sdiv i32 %i.0, 64, !dbg !1058
  %7 = sext i32 %6 to i64, !dbg !1058
  %8 = getelementptr inbounds %struct.fd_set* %in_read, i64 0, i32 0, i64 %7, !dbg !1058
  %9 = load i64* %8, align 8, !dbg !1058
  %10 = and i32 %i.0, 63
  %11 = shl i32 1, %10, !dbg !1058
  %12 = sext i32 %11 to i64, !dbg !1058
  %13 = and i64 %9, %12, !dbg !1058
  %14 = icmp eq i64 %13, 0, !dbg !1058
  br i1 %14, label %bb19, label %bb21, !dbg !1058

bb19:                                             ; preds = %bb18
  %15 = getelementptr inbounds %struct.fd_set* %in_write, i64 0, i32 0, i64 %7, !dbg !1058
  %16 = load i64* %15, align 8, !dbg !1058
  %17 = and i64 %16, %12, !dbg !1058
  %18 = icmp eq i64 %17, 0, !dbg !1058
  br i1 %18, label %bb20, label %bb21, !dbg !1058

bb20:                                             ; preds = %bb19
  %19 = getelementptr inbounds %struct.fd_set* %in_except, i64 0, i32 0, i64 %7, !dbg !1058
  %20 = load i64* %19, align 8, !dbg !1058
  %21 = and i64 %20, %12, !dbg !1058
  %22 = icmp eq i64 %21, 0, !dbg !1058
  br i1 %22, label %bb39, label %bb21, !dbg !1058

bb21:                                             ; preds = %bb20, %bb19, %bb18
  %23 = icmp ult i32 %i.0, 32, !dbg !1059
  br i1 %23, label %bb.i, label %bb22, !dbg !1059

bb.i:                                             ; preds = %bb21
  %24 = load i32* %scevgep83, align 4, !dbg !1061
  %25 = and i32 %24, 1
  %toBool.i = icmp eq i32 %25, 0, !dbg !1061
  %26 = icmp eq %struct.exe_file_t* %scevgep80, null, !dbg !1062
  %or.cond = or i1 %toBool.i, %26
  br i1 %or.cond, label %bb22, label %bb23, !dbg !1061

bb22:                                             ; preds = %bb21, %bb.i
  tail call void @llvm.dbg.value(metadata !1063, i64 0, metadata !273), !dbg !1064
  %27 = call i32* @__errno_location() nounwind readnone, !dbg !1065
  store i32 9, i32* %27, align 4, !dbg !1065
  br label %bb61, !dbg !1066

bb23:                                             ; preds = %bb.i
  %28 = load %struct.exe_disk_file_t** %scevgep82, align 8, !dbg !1067
  %29 = icmp eq %struct.exe_disk_file_t* %28, null, !dbg !1067
  %30 = icmp ne i64 %13, 0, !dbg !1068
  br i1 %29, label %bb31, label %bb24, !dbg !1067

bb24:                                             ; preds = %bb23
  br i1 %30, label %bb25, label %bb26, !dbg !1068

bb25:                                             ; preds = %bb24
  %31 = getelementptr inbounds %struct.fd_set* %read, i64 0, i32 0, i64 %7, !dbg !1068
  %32 = load i64* %31, align 8, !dbg !1068
  %33 = or i64 %32, %12, !dbg !1068
  store i64 %33, i64* %31, align 8, !dbg !1068
  br label %bb26, !dbg !1068

bb26:                                             ; preds = %bb24, %bb25
  %34 = getelementptr inbounds %struct.fd_set* %in_write, i64 0, i32 0, i64 %7, !dbg !1069
  %35 = load i64* %34, align 8, !dbg !1069
  %36 = and i64 %35, %12, !dbg !1069
  %37 = icmp eq i64 %36, 0, !dbg !1069
  br i1 %37, label %bb28, label %bb27, !dbg !1069

bb27:                                             ; preds = %bb26
  %38 = getelementptr inbounds %struct.fd_set* %write, i64 0, i32 0, i64 %7, !dbg !1069
  %39 = load i64* %38, align 8, !dbg !1069
  %40 = or i64 %39, %12, !dbg !1069
  store i64 %40, i64* %38, align 8, !dbg !1069
  br label %bb28, !dbg !1069

bb28:                                             ; preds = %bb26, %bb27
  %41 = getelementptr inbounds %struct.fd_set* %in_except, i64 0, i32 0, i64 %7, !dbg !1070
  %42 = load i64* %41, align 8, !dbg !1070
  %43 = and i64 %42, %12, !dbg !1070
  %44 = icmp eq i64 %43, 0, !dbg !1070
  br i1 %44, label %bb30, label %bb29, !dbg !1070

bb29:                                             ; preds = %bb28
  %45 = getelementptr inbounds %struct.fd_set* %except, i64 0, i32 0, i64 %7, !dbg !1070
  %46 = load i64* %45, align 8, !dbg !1070
  %47 = or i64 %46, %12, !dbg !1070
  store i64 %47, i64* %45, align 8, !dbg !1070
  br label %bb30, !dbg !1070

bb30:                                             ; preds = %bb28, %bb29
  %48 = add nsw i32 %count.1, 1, !dbg !1071
  br label %bb39, !dbg !1071

bb31:                                             ; preds = %bb23
  br i1 %30, label %bb32, label %bb33, !dbg !1072

bb32:                                             ; preds = %bb31
  %49 = load i32* %scevgep8081, align 8, !dbg !1072
  %50 = sdiv i32 %49, 64, !dbg !1072
  %51 = sext i32 %50 to i64, !dbg !1072
  %52 = getelementptr inbounds %struct.fd_set* %os_read, i64 0, i32 0, i64 %51, !dbg !1072
  %53 = load i64* %52, align 8, !dbg !1072
  %54 = and i32 %49, 63
  %55 = shl i32 1, %54, !dbg !1072
  %56 = sext i32 %55 to i64, !dbg !1072
  %57 = or i64 %56, %53, !dbg !1072
  store i64 %57, i64* %52, align 8, !dbg !1072
  br label %bb33, !dbg !1072

bb33:                                             ; preds = %bb31, %bb32
  %58 = getelementptr inbounds %struct.fd_set* %in_write, i64 0, i32 0, i64 %7, !dbg !1073
  %59 = load i64* %58, align 8, !dbg !1073
  %60 = and i64 %59, %12, !dbg !1073
  %61 = icmp eq i64 %60, 0, !dbg !1073
  br i1 %61, label %bb35, label %bb34, !dbg !1073

bb34:                                             ; preds = %bb33
  %62 = load i32* %scevgep8081, align 8, !dbg !1073
  %63 = sdiv i32 %62, 64, !dbg !1073
  %64 = sext i32 %63 to i64, !dbg !1073
  %65 = getelementptr inbounds %struct.fd_set* %os_write, i64 0, i32 0, i64 %64, !dbg !1073
  %66 = load i64* %65, align 8, !dbg !1073
  %67 = and i32 %62, 63
  %68 = shl i32 1, %67, !dbg !1073
  %69 = sext i32 %68 to i64, !dbg !1073
  %70 = or i64 %69, %66, !dbg !1073
  store i64 %70, i64* %65, align 8, !dbg !1073
  br label %bb35, !dbg !1073

bb35:                                             ; preds = %bb33, %bb34
  %71 = getelementptr inbounds %struct.fd_set* %in_except, i64 0, i32 0, i64 %7, !dbg !1074
  %72 = load i64* %71, align 8, !dbg !1074
  %73 = and i64 %72, %12, !dbg !1074
  %74 = icmp eq i64 %73, 0, !dbg !1074
  %.pre = load i32* %scevgep8081, align 8
  br i1 %74, label %bb37, label %bb36, !dbg !1074

bb36:                                             ; preds = %bb35
  %75 = sdiv i32 %.pre, 64, !dbg !1074
  %76 = sext i32 %75 to i64, !dbg !1074
  %77 = getelementptr inbounds %struct.fd_set* %os_except, i64 0, i32 0, i64 %76, !dbg !1074
  %78 = load i64* %77, align 8, !dbg !1074
  %79 = and i32 %.pre, 63
  %80 = shl i32 1, %79, !dbg !1074
  %81 = sext i32 %80 to i64, !dbg !1074
  %82 = or i64 %81, %78, !dbg !1074
  store i64 %82, i64* %77, align 8, !dbg !1074
  br label %bb37, !dbg !1074

bb37:                                             ; preds = %bb35, %bb36
  %83 = add nsw i32 %.pre, 1, !dbg !1075
  %84 = icmp slt i32 %.pre, %os_nfds.1, !dbg !1075
  %os_nfds.1. = select i1 %84, i32 %os_nfds.1, i32 %83
  br label %bb39

bb39:                                             ; preds = %bb37, %bb20, %bb30
  %count.0 = phi i32 [ %48, %bb30 ], [ %count.1, %bb20 ], [ %count.1, %bb37 ]
  %os_nfds.0 = phi i32 [ %os_nfds.1, %bb30 ], [ %os_nfds.1, %bb20 ], [ %os_nfds.1., %bb37 ]
  %indvar.next78 = add i64 %indvar77, 1
  br label %bb40, !dbg !1057

bb40:                                             ; preds = %bb39, %bb14
  %indvar77 = phi i64 [ %indvar.next78, %bb39 ], [ 0, %bb14 ]
  %count.1 = phi i32 [ %count.0, %bb39 ], [ 0, %bb14 ]
  %os_nfds.1 = phi i32 [ %os_nfds.0, %bb39 ], [ 0, %bb14 ]
  %i.0 = trunc i64 %indvar77 to i32
  %scevgep80 = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar77
  %scevgep8081 = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar77, i32 0
  %scevgep82 = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar77, i32 3
  %scevgep83 = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar77, i32 1
  %85 = icmp slt i32 %i.0, %nfds, !dbg !1057
  br i1 %85, label %bb18, label %bb41, !dbg !1057

bb41:                                             ; preds = %bb40
  %86 = icmp sgt i32 %os_nfds.1, 0, !dbg !1076
  br i1 %86, label %bb42, label %bb61, !dbg !1076

bb42:                                             ; preds = %bb41
  call void @llvm.dbg.declare(metadata !{%struct.timespec* %tv}, metadata !422), !dbg !1077
  %87 = getelementptr inbounds %struct.timespec* %tv, i64 0, i32 0, !dbg !1077
  store i64 0, i64* %87, align 8, !dbg !1077
  %88 = getelementptr inbounds %struct.timespec* %tv, i64 0, i32 1, !dbg !1077
  store i64 0, i64* %88, align 8, !dbg !1077
  %89 = call i64 (i64, ...)* @syscall(i64 23, i32 %os_nfds.1, %struct.fd_set* %os_read, %struct.fd_set* %os_write, %struct.fd_set* %os_except, %struct.timespec* %tv) nounwind, !dbg !1078
  %90 = trunc i64 %89 to i32, !dbg !1078
  call void @llvm.dbg.value(metadata !{i32 %90}, i64 0, metadata !424), !dbg !1078
  %91 = icmp eq i32 %90, -1, !dbg !1079
  br i1 %91, label %bb43, label %bb45, !dbg !1079

bb43:                                             ; preds = %bb42
  %92 = icmp eq i32 %count.1, 0, !dbg !1080
  br i1 %92, label %bb44, label %bb61, !dbg !1080

bb44:                                             ; preds = %bb43
  %93 = call i32* @__errno_location() nounwind readnone, !dbg !1081
  %94 = call i32 @klee_get_errno() nounwind, !dbg !1081
  store i32 %94, i32* %93, align 4, !dbg !1081
  br label %bb61, !dbg !1082

bb45:                                             ; preds = %bb42
  %95 = add nsw i32 %90, %count.1, !dbg !1083
  call void @llvm.dbg.value(metadata !{i32 %95}, i64 0, metadata !418), !dbg !1083
  call void @llvm.dbg.value(metadata !625, i64 0, metadata !417), !dbg !1084
  %96 = icmp sgt i32 %nfds, 0, !dbg !1084
  br i1 %96, label %bb46.lr.ph, label %bb61, !dbg !1084

bb46.lr.ph:                                       ; preds = %bb45
  %tmp = zext i32 %nfds to i64
  br label %bb46

bb46:                                             ; preds = %bb58, %bb46.lr.ph
  %indvar = phi i64 [ 0, %bb46.lr.ph ], [ %indvar.next, %bb58 ]
  %i.168 = trunc i64 %indvar to i32
  %scevgep = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar
  %scevgep72 = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar, i32 0
  %scevgep73 = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar, i32 3
  %97 = icmp ult i32 %i.168, 32, !dbg !1085
  br i1 %97, label %bb.i64, label %bb58, !dbg !1085

bb.i64:                                           ; preds = %bb46
  %scevgep74 = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar, i32 1
  %98 = load i32* %scevgep74, align 4, !dbg !1087
  %99 = and i32 %98, 1
  %toBool.i63 = icmp eq i32 %99, 0, !dbg !1087
  %100 = icmp eq %struct.exe_file_t* %scevgep, null, !dbg !1088
  %or.cond84 = or i1 %toBool.i63, %100
  br i1 %or.cond84, label %bb58, label %bb48, !dbg !1087

bb48:                                             ; preds = %bb.i64
  %101 = load %struct.exe_disk_file_t** %scevgep73, align 8, !dbg !1088
  %102 = icmp eq %struct.exe_disk_file_t* %101, null, !dbg !1088
  br i1 %102, label %bb49, label %bb58, !dbg !1088

bb49:                                             ; preds = %bb48
  br i1 %0, label %bb52, label %bb50, !dbg !1089

bb50:                                             ; preds = %bb49
  %103 = load i32* %scevgep72, align 8, !dbg !1089
  %104 = sdiv i32 %103, 64, !dbg !1089
  %105 = sext i32 %104 to i64, !dbg !1089
  %106 = getelementptr inbounds %struct.fd_set* %os_read, i64 0, i32 0, i64 %105, !dbg !1089
  %107 = load i64* %106, align 8, !dbg !1089
  %108 = and i32 %103, 63
  %109 = shl i32 1, %108, !dbg !1089
  %110 = sext i32 %109 to i64, !dbg !1089
  %111 = and i64 %110, %107, !dbg !1089
  %112 = icmp eq i64 %111, 0, !dbg !1089
  br i1 %112, label %bb52, label %bb51, !dbg !1089

bb51:                                             ; preds = %bb50
  %113 = sdiv i32 %i.168, 64, !dbg !1089
  %114 = sext i32 %113 to i64, !dbg !1089
  %115 = getelementptr inbounds %struct.fd_set* %read, i64 0, i32 0, i64 %114, !dbg !1089
  %116 = load i64* %115, align 8, !dbg !1089
  %117 = and i32 %i.168, 63
  %118 = shl i32 1, %117, !dbg !1089
  %119 = sext i32 %118 to i64, !dbg !1089
  %120 = or i64 %116, %119, !dbg !1089
  store i64 %120, i64* %115, align 8, !dbg !1089
  br label %bb52, !dbg !1089

bb52:                                             ; preds = %bb50, %bb49, %bb51
  br i1 %2, label %bb55, label %bb53, !dbg !1090

bb53:                                             ; preds = %bb52
  %121 = load i32* %scevgep72, align 8, !dbg !1090
  %122 = sdiv i32 %121, 64, !dbg !1090
  %123 = sext i32 %122 to i64, !dbg !1090
  %124 = getelementptr inbounds %struct.fd_set* %os_write, i64 0, i32 0, i64 %123, !dbg !1090
  %125 = load i64* %124, align 8, !dbg !1090
  %126 = and i32 %121, 63
  %127 = shl i32 1, %126, !dbg !1090
  %128 = sext i32 %127 to i64, !dbg !1090
  %129 = and i64 %128, %125, !dbg !1090
  %130 = icmp eq i64 %129, 0, !dbg !1090
  br i1 %130, label %bb55, label %bb54, !dbg !1090

bb54:                                             ; preds = %bb53
  %131 = sdiv i32 %i.168, 64, !dbg !1090
  %132 = sext i32 %131 to i64, !dbg !1090
  %133 = getelementptr inbounds %struct.fd_set* %write, i64 0, i32 0, i64 %132, !dbg !1090
  %134 = load i64* %133, align 8, !dbg !1090
  %135 = and i32 %i.168, 63
  %136 = shl i32 1, %135, !dbg !1090
  %137 = sext i32 %136 to i64, !dbg !1090
  %138 = or i64 %134, %137, !dbg !1090
  store i64 %138, i64* %133, align 8, !dbg !1090
  br label %bb55, !dbg !1090

bb55:                                             ; preds = %bb53, %bb52, %bb54
  br i1 %4, label %bb58, label %bb56, !dbg !1091

bb56:                                             ; preds = %bb55
  %139 = load i32* %scevgep72, align 8, !dbg !1091
  %140 = sdiv i32 %139, 64, !dbg !1091
  %141 = sext i32 %140 to i64, !dbg !1091
  %142 = getelementptr inbounds %struct.fd_set* %os_except, i64 0, i32 0, i64 %141, !dbg !1091
  %143 = load i64* %142, align 8, !dbg !1091
  %144 = and i32 %139, 63
  %145 = shl i32 1, %144, !dbg !1091
  %146 = sext i32 %145 to i64, !dbg !1091
  %147 = and i64 %146, %143, !dbg !1091
  %148 = icmp eq i64 %147, 0, !dbg !1091
  br i1 %148, label %bb58, label %bb57, !dbg !1091

bb57:                                             ; preds = %bb56
  %149 = sdiv i32 %i.168, 64, !dbg !1091
  %150 = sext i32 %149 to i64, !dbg !1091
  %151 = getelementptr inbounds %struct.fd_set* %except, i64 0, i32 0, i64 %150, !dbg !1091
  %152 = load i64* %151, align 8, !dbg !1091
  %153 = and i32 %i.168, 63
  %154 = shl i32 1, %153, !dbg !1091
  %155 = sext i32 %154 to i64, !dbg !1091
  %156 = or i64 %152, %155, !dbg !1091
  store i64 %156, i64* %151, align 8, !dbg !1091
  br label %bb58, !dbg !1091

bb58:                                             ; preds = %bb46, %bb.i64, %bb56, %bb55, %bb57, %bb48
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp
  br i1 %exitcond, label %bb61, label %bb46, !dbg !1084

bb61:                                             ; preds = %bb45, %bb58, %bb41, %bb43, %bb44, %bb22
  %.0 = phi i32 [ -1, %bb22 ], [ -1, %bb44 ], [ %count.1, %bb43 ], [ %count.1, %bb41 ], [ %95, %bb58 ], [ %95, %bb45 ]
  ret i32 %.0, !dbg !1066
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @close(i32 %fd) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !427), !dbg !1092
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !430), !dbg !1093
  %0 = load i32* @n_calls.4869, align 4, !dbg !1094
  %1 = add nsw i32 %0, 1, !dbg !1094
  store i32 %1, i32* @n_calls.4869, align 4, !dbg !1094
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !273), !dbg !1095
  %2 = icmp ult i32 %fd, 32, !dbg !1097
  br i1 %2, label %bb.i, label %bb, !dbg !1097

bb.i:                                             ; preds = %entry
  %3 = sext i32 %fd to i64, !dbg !1098
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !1098
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !1099
  %5 = load i32* %4, align 4, !dbg !1099
  %6 = and i32 %5, 1
  %toBool.i = icmp eq i32 %6, 0, !dbg !1099
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1099

__get_file.exit:                                  ; preds = %bb.i
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !1098
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %7}, i64 0, metadata !428), !dbg !1096
  %8 = icmp eq %struct.exe_file_t* %7, null, !dbg !1100
  br i1 %8, label %bb, label %bb1, !dbg !1100

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %9 = tail call i32* @__errno_location() nounwind readnone, !dbg !1101
  store i32 9, i32* %9, align 4, !dbg !1101
  br label %bb5, !dbg !1102

bb1:                                              ; preds = %__get_file.exit
  %10 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1103
  %11 = icmp eq i32 %10, 0, !dbg !1103
  br i1 %11, label %bb4, label %bb2, !dbg !1103

bb2:                                              ; preds = %bb1
  %12 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 8, !dbg !1103
  %13 = load i32* %12, align 4, !dbg !1103
  %14 = icmp eq i32 %13, %1, !dbg !1103
  br i1 %14, label %bb3, label %bb4, !dbg !1103

bb3:                                              ; preds = %bb2
  %15 = add i32 %10, -1, !dbg !1104
  store i32 %15, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1104
  %16 = tail call i32* @__errno_location() nounwind readnone, !dbg !1105
  store i32 5, i32* %16, align 4, !dbg !1105
  br label %bb5, !dbg !1106

bb4:                                              ; preds = %bb1, %bb2
  %17 = bitcast %struct.exe_file_t* %7 to i8*, !dbg !1107
  tail call void @llvm.memset.p0i8.i64(i8* %17, i8 0, i64 24, i32 8, i1 false), !dbg !1107
  br label %bb5, !dbg !1108

bb5:                                              ; preds = %bb4, %bb3, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb3 ], [ 0, %bb4 ]
  ret i32 %.0, !dbg !1102
}

define i32 @dup2(i32 %oldfd, i32 %newfd) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !431), !dbg !1109
  tail call void @llvm.dbg.value(metadata !{i32 %newfd}, i64 0, metadata !432), !dbg !1109
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !273), !dbg !1110
  %0 = icmp ult i32 %oldfd, 32, !dbg !1112
  br i1 %0, label %bb.i, label %bb, !dbg !1112

bb.i:                                             ; preds = %entry
  %1 = sext i32 %oldfd to i64, !dbg !1113
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !1113
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1, !dbg !1114
  %3 = load i32* %2, align 4, !dbg !1114
  %4 = and i32 %3, 1
  %toBool.i = icmp eq i32 %4, 0, !dbg !1114
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1114

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, !dbg !1113
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !433), !dbg !1111
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !1115
  %7 = icmp ugt i32 %newfd, 31, !dbg !1115
  %8 = or i1 %6, %7, !dbg !1115
  br i1 %8, label %bb, label %bb3, !dbg !1115

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %9 = tail call i32* @__errno_location() nounwind readnone, !dbg !1116
  store i32 9, i32* %9, align 4, !dbg !1116
  br label %bb7, !dbg !1117

bb3:                                              ; preds = %__get_file.exit
  %10 = sext i32 %newfd to i64, !dbg !1118
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !435), !dbg !1118
  %11 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %10, i32 1, !dbg !1119
  %12 = load i32* %11, align 4, !dbg !1119
  %13 = and i32 %12, 1
  %toBool4 = icmp eq i32 %13, 0, !dbg !1119
  br i1 %toBool4, label %bb6, label %bb5, !dbg !1119

bb5:                                              ; preds = %bb3
  tail call void @llvm.dbg.value(metadata !{i32 %newfd}, i64 0, metadata !427) nounwind, !dbg !1120
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !430) nounwind, !dbg !1121
  %14 = load i32* @n_calls.4869, align 4, !dbg !1122
  %15 = add nsw i32 %14, 1, !dbg !1122
  store i32 %15, i32* @n_calls.4869, align 4, !dbg !1122
  tail call void @llvm.dbg.value(metadata !{i32 %newfd}, i64 0, metadata !273) nounwind, !dbg !1123
  %16 = icmp ult i32 %newfd, 32, !dbg !1125
  br i1 %16, label %__get_file.exit.i, label %bb.i9, !dbg !1125

__get_file.exit.i:                                ; preds = %bb5
  %17 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %10, !dbg !1126
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %17}, i64 0, metadata !428) nounwind, !dbg !1124
  %18 = icmp eq %struct.exe_file_t* %17, null, !dbg !1127
  br i1 %18, label %bb.i9, label %bb1.i10, !dbg !1127

bb.i9:                                            ; preds = %__get_file.exit.i, %bb5
  %19 = tail call i32* @__errno_location() nounwind readnone, !dbg !1128
  store i32 9, i32* %19, align 4, !dbg !1128
  br label %bb6, !dbg !1129

bb1.i10:                                          ; preds = %__get_file.exit.i
  %20 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1130
  %21 = icmp eq i32 %20, 0, !dbg !1130
  br i1 %21, label %bb4.i, label %bb2.i, !dbg !1130

bb2.i:                                            ; preds = %bb1.i10
  %22 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 8, !dbg !1130
  %23 = load i32* %22, align 4, !dbg !1130
  %24 = icmp eq i32 %23, %15, !dbg !1130
  br i1 %24, label %bb3.i, label %bb4.i, !dbg !1130

bb3.i:                                            ; preds = %bb2.i
  %25 = add i32 %20, -1, !dbg !1131
  store i32 %25, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1131
  %26 = tail call i32* @__errno_location() nounwind readnone, !dbg !1132
  store i32 5, i32* %26, align 4, !dbg !1132
  br label %bb6, !dbg !1133

bb4.i:                                            ; preds = %bb2.i, %bb1.i10
  %27 = bitcast %struct.exe_file_t* %17 to i8*, !dbg !1134
  tail call void @llvm.memset.p0i8.i64(i8* %27, i8 0, i64 24, i32 8, i1 false) nounwind, !dbg !1134
  br label %bb6, !dbg !1135

bb6:                                              ; preds = %bb4.i, %bb3.i, %bb.i9, %bb3
  %28 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %10, i32 0, !dbg !1136
  %29 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0, !dbg !1136
  %30 = load i32* %29, align 8, !dbg !1136
  store i32 %30, i32* %28, align 8, !dbg !1136
  %31 = load i32* %2, align 4, !dbg !1136
  %32 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %10, i32 2, !dbg !1136
  %33 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 2, !dbg !1136
  %34 = load i64* %33, align 8, !dbg !1136
  store i64 %34, i64* %32, align 8, !dbg !1136
  %35 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %10, i32 3, !dbg !1136
  %36 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3, !dbg !1136
  %37 = load %struct.exe_disk_file_t** %36, align 8, !dbg !1136
  store %struct.exe_disk_file_t* %37, %struct.exe_disk_file_t** %35, align 8, !dbg !1136
  %38 = and i32 %31, -3, !dbg !1137
  store i32 %38, i32* %11, align 4, !dbg !1137
  br label %bb7, !dbg !1138

bb7:                                              ; preds = %bb6, %bb
  %.0 = phi i32 [ -1, %bb ], [ %newfd, %bb6 ]
  ret i32 %.0, !dbg !1117
}

define i32 @dup(i32 %oldfd) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !437), !dbg !1139
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !273), !dbg !1140
  %0 = icmp ult i32 %oldfd, 32, !dbg !1142
  br i1 %0, label %bb.i, label %bb, !dbg !1142

bb.i:                                             ; preds = %entry
  %1 = sext i32 %oldfd to i64, !dbg !1143
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !1143
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1, !dbg !1144
  %3 = load i32* %2, align 4, !dbg !1144
  %4 = and i32 %3, 1
  %toBool.i = icmp eq i32 %4, 0, !dbg !1144
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1144

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, !dbg !1143
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !438), !dbg !1141
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !1145
  br i1 %6, label %bb, label %bb4, !dbg !1145

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !1146
  store i32 9, i32* %7, align 4, !dbg !1146
  br label %bb8, !dbg !1147

bb2:                                              ; preds = %bb4
  %scevgep = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar, i32 1
  %8 = load i32* %scevgep, align 4, !dbg !1148
  %9 = and i32 %8, 1, !dbg !1148
  %10 = icmp eq i32 %9, 0, !dbg !1148
  br i1 %10, label %bb7, label %bb3, !dbg !1148

bb3:                                              ; preds = %bb2
  %indvar.next = add i64 %indvar, 1
  br label %bb4, !dbg !1149

bb4:                                              ; preds = %__get_file.exit, %bb3
  %indvar = phi i64 [ %indvar.next, %bb3 ], [ 0, %__get_file.exit ]
  %fd.0 = trunc i64 %indvar to i32
  %11 = icmp slt i32 %fd.0, 32, !dbg !1149
  br i1 %11, label %bb2, label %bb5, !dbg !1149

bb5:                                              ; preds = %bb4
  %12 = icmp eq i32 %fd.0, 32, !dbg !1150
  br i1 %12, label %bb6, label %bb7, !dbg !1150

bb6:                                              ; preds = %bb5
  %13 = tail call i32* @__errno_location() nounwind readnone, !dbg !1151
  store i32 24, i32* %13, align 4, !dbg !1151
  br label %bb8, !dbg !1152

bb7:                                              ; preds = %bb2, %bb5
  %14 = tail call i32 @dup2(i32 %oldfd, i32 %fd.0) nounwind, !dbg !1153
  br label %bb8, !dbg !1153

bb8:                                              ; preds = %bb7, %bb6, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb6 ], [ %14, %bb7 ]
  ret i32 %.0, !dbg !1147
}

define i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !442), !dbg !1154
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !443), !dbg !1154
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !444), !dbg !1154
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !448), !dbg !1155
  br label %bb2, !dbg !1155

bb:                                               ; preds = %bb2
  %scevgep = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar, i32 1
  %0 = load i32* %scevgep, align 4, !dbg !1156
  %1 = and i32 %0, 1, !dbg !1156
  %2 = icmp eq i32 %1, 0, !dbg !1156
  br i1 %2, label %bb5, label %bb1, !dbg !1156

bb1:                                              ; preds = %bb
  %indvar.next = add i64 %indvar, 1
  br label %bb2, !dbg !1155

bb2:                                              ; preds = %bb1, %entry
  %indvar = phi i64 [ %indvar.next, %bb1 ], [ 0, %entry ]
  %fd.0 = trunc i64 %indvar to i32
  %3 = icmp slt i32 %fd.0, 32, !dbg !1155
  br i1 %3, label %bb, label %bb3, !dbg !1155

bb3:                                              ; preds = %bb2
  %4 = icmp eq i32 %fd.0, 32, !dbg !1157
  br i1 %4, label %bb4, label %bb5, !dbg !1157

bb4:                                              ; preds = %bb3
  %5 = tail call i32* @__errno_location() nounwind readnone, !dbg !1158
  store i32 24, i32* %5, align 4, !dbg !1158
  br label %bb25, !dbg !1159

bb5:                                              ; preds = %bb, %bb3
  %6 = sext i32 %fd.0 to i64, !dbg !1160
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %6, !dbg !1160
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %7}, i64 0, metadata !447), !dbg !1160
  %8 = bitcast %struct.exe_file_t* %7 to i8*, !dbg !1161
  tail call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 24, i32 8, i1 false), !dbg !1161
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !267), !dbg !1162
  %9 = load i8* %pathname, align 1, !dbg !1164
  tail call void @llvm.dbg.value(metadata !{i8 %9}, i64 0, metadata !268), !dbg !1164
  %10 = icmp eq i8 %9, 0, !dbg !1165
  br i1 %10, label %bb16, label %bb.i, !dbg !1165

bb.i:                                             ; preds = %bb5
  %11 = getelementptr inbounds i8* %pathname, i64 1, !dbg !1165
  %12 = load i8* %11, align 1, !dbg !1165
  %13 = icmp eq i8 %12, 0, !dbg !1165
  br i1 %13, label %bb8.preheader.i, label %bb16, !dbg !1165

bb8.preheader.i:                                  ; preds = %bb.i
  %14 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1166
  %15 = sext i8 %9 to i32, !dbg !1167
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %27, 24
  %16 = ashr exact i32 %sext.i, 24, !dbg !1167
  %17 = add nsw i32 %16, 65, !dbg !1167
  %18 = icmp eq i32 %15, %17, !dbg !1167
  br i1 %18, label %bb4.i, label %bb7.i, !dbg !1167

bb4.i:                                            ; preds = %bb3.i
  %19 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1168
  %20 = zext i32 %27 to i64, !dbg !1168
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !271), !dbg !1168
  %21 = getelementptr inbounds %struct.exe_disk_file_t* %19, i64 %20, i32 2, !dbg !1169
  %22 = load %struct.stat** %21, align 8, !dbg !1169
  %23 = getelementptr inbounds %struct.stat* %22, i64 0, i32 1, !dbg !1169
  %24 = load i64* %23, align 8, !dbg !1169
  %25 = icmp eq i64 %24, 0, !dbg !1169
  br i1 %25, label %bb16, label %__get_sym_file.exit, !dbg !1169

bb7.i:                                            ; preds = %bb3.i
  %26 = add i32 %27, 1, !dbg !1166
  br label %bb8.i, !dbg !1166

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %27 = phi i32 [ %26, %bb7.i ], [ 0, %bb8.preheader.i ]
  %28 = icmp ugt i32 %14, %27, !dbg !1166
  br i1 %28, label %bb3.i, label %bb16, !dbg !1166

__get_sym_file.exit:                              ; preds = %bb4.i
  %29 = getelementptr inbounds %struct.exe_disk_file_t* %19, i64 %20, !dbg !1168
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %29}, i64 0, metadata !445), !dbg !1163
  %30 = icmp eq %struct.exe_disk_file_t* %29, null, !dbg !1170
  br i1 %30, label %bb16, label %bb6, !dbg !1170

bb6:                                              ; preds = %__get_sym_file.exit
  %31 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %6, i32 3, !dbg !1171
  store %struct.exe_disk_file_t* %29, %struct.exe_disk_file_t** %31, align 8, !dbg !1171
  %32 = and i32 %flags, 192
  switch i32 %32, label %bb12 [
    i32 192, label %bb8
    i32 128, label %bb11
  ]

bb8:                                              ; preds = %bb6
  %33 = tail call i32* @__errno_location() nounwind readnone, !dbg !1172
  store i32 17, i32* %33, align 4, !dbg !1172
  br label %bb25, !dbg !1173

bb11:                                             ; preds = %bb6
  tail call void @klee_warning(i8* getelementptr inbounds ([47 x i8]* @.str7, i64 0, i64 0)) nounwind, !dbg !1174
  %34 = tail call i32* @__errno_location() nounwind readnone, !dbg !1175
  store i32 13, i32* %34, align 4, !dbg !1175
  br label %bb25, !dbg !1176

bb12:                                             ; preds = %bb6
  %35 = load %struct.stat** %21, align 8, !dbg !1177
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !280), !dbg !1178
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %35}, i64 0, metadata !281), !dbg !1178
  %36 = getelementptr inbounds %struct.stat* %35, i64 0, i32 3, !dbg !1179
  %37 = load i32* %36, align 8, !dbg !1179
  tail call void @llvm.dbg.value(metadata !{i32 %37}, i64 0, metadata !285), !dbg !1179
  %38 = and i32 %flags, 2, !dbg !1180
  %39 = icmp eq i32 %38, 0, !dbg !1180
  %40 = and i32 %flags, 3
  %41 = icmp eq i32 %40, 0
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !282), !dbg !1181
  br i1 %39, label %bb9.i, label %bb7.i34, !dbg !1182

bb7.i34:                                          ; preds = %bb12
  %42 = and i32 %37, 292, !dbg !1182
  %43 = icmp eq i32 %42, 0, !dbg !1182
  br i1 %43, label %bb9.i, label %bb13, !dbg !1182

bb9.i:                                            ; preds = %bb7.i34, %bb12
  br i1 %41, label %bb14, label %bb10.i, !dbg !1183

bb10.i:                                           ; preds = %bb9.i
  %44 = and i32 %37, 146, !dbg !1183
  %45 = icmp eq i32 %44, 0, !dbg !1183
  br i1 %45, label %bb13, label %bb14, !dbg !1183

bb13:                                             ; preds = %bb7.i34, %bb10.i
  %46 = tail call i32* @__errno_location() nounwind readnone, !dbg !1184
  store i32 13, i32* %46, align 4, !dbg !1184
  br label %bb25, !dbg !1185

bb14:                                             ; preds = %bb10.i, %bb9.i
  %47 = and i32 %37, -512, !dbg !1186
  %48 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 1), align 8, !dbg !1186
  %not = xor i32 %48, -1, !dbg !1186
  %49 = and i32 %not, %mode, !dbg !1186
  %50 = or i32 %49, %47, !dbg !1186
  store i32 %50, i32* %36, align 8, !dbg !1186
  br label %bb19, !dbg !1186

bb16:                                             ; preds = %bb8.i, %bb4.i, %bb5, %bb.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !354) nounwind, !dbg !1187
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !344) nounwind, !dbg !1189
  %51 = ptrtoint i8* %pathname to i64, !dbg !1191
  %52 = tail call i64 @klee_get_valuel(i64 %51) nounwind, !dbg !1191
  %53 = inttoptr i64 %52 to i8*, !dbg !1191
  tail call void @llvm.dbg.value(metadata !{i8* %53}, i64 0, metadata !345) nounwind, !dbg !1191
  %54 = icmp eq i8* %53, %pathname, !dbg !1192
  %55 = zext i1 %54 to i64, !dbg !1192
  tail call void @klee_assume(i64 %55) nounwind, !dbg !1192
  tail call void @llvm.dbg.value(metadata !{i8* %53}, i64 0, metadata !355) nounwind, !dbg !1190
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !357) nounwind, !dbg !1193
  br label %bb.i30, !dbg !1193

bb.i30:                                           ; preds = %bb6.i32, %bb16
  %sc.0.i = phi i8* [ %53, %bb16 ], [ %sc.1.i, %bb6.i32 ]
  %56 = phi i32 [ 0, %bb16 ], [ %68, %bb6.i32 ]
  %tmp.i = add i32 %56, -1
  %57 = load i8* %sc.0.i, align 1, !dbg !1194
  %58 = and i32 %tmp.i, %56, !dbg !1195
  %59 = icmp eq i32 %58, 0, !dbg !1195
  br i1 %59, label %bb1.i, label %bb5.i, !dbg !1195

bb1.i:                                            ; preds = %bb.i30
  switch i8 %57, label %bb6.i32 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i31
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %57}, i64 0, metadata !358) nounwind, !dbg !1194
  store i8 0, i8* %sc.0.i, align 1, !dbg !1196
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !355) nounwind, !dbg !1196
  br label %__concretize_string.exit, !dbg !1196

bb4.i31:                                          ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !1197
  %60 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1197
  br label %bb6.i32, !dbg !1197

bb5.i:                                            ; preds = %bb.i30
  %61 = sext i8 %57 to i64, !dbg !1198
  %62 = tail call i64 @klee_get_valuel(i64 %61) nounwind, !dbg !1198
  %63 = trunc i64 %62 to i8, !dbg !1198
  %64 = icmp eq i8 %63, %57, !dbg !1199
  %65 = zext i1 %64 to i64, !dbg !1199
  tail call void @klee_assume(i64 %65) nounwind, !dbg !1199
  store i8 %63, i8* %sc.0.i, align 1, !dbg !1200
  %66 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1200
  %67 = icmp eq i8 %63, 0, !dbg !1201
  br i1 %67, label %__concretize_string.exit, label %bb6.i32, !dbg !1201

bb6.i32:                                          ; preds = %bb5.i, %bb4.i31, %bb1.i
  %sc.1.i = phi i8* [ %60, %bb4.i31 ], [ %66, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %68 = add i32 %56, 1, !dbg !1193
  br label %bb.i30, !dbg !1193

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %69 = tail call i64 (i64, ...)* @syscall(i64 2, i8* %pathname, i32 %flags, i32 %mode) nounwind, !dbg !1188
  %70 = trunc i64 %69 to i32, !dbg !1188
  tail call void @llvm.dbg.value(metadata !{i32 %70}, i64 0, metadata !449), !dbg !1188
  %71 = icmp eq i32 %70, -1, !dbg !1202
  br i1 %71, label %bb17, label %bb18, !dbg !1202

bb17:                                             ; preds = %__concretize_string.exit
  %72 = tail call i32* @__errno_location() nounwind readnone, !dbg !1203
  %73 = tail call i32 @klee_get_errno() nounwind, !dbg !1203
  store i32 %73, i32* %72, align 4, !dbg !1203
  br label %bb25, !dbg !1204

bb18:                                             ; preds = %__concretize_string.exit
  %74 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %6, i32 0, !dbg !1205
  store i32 %70, i32* %74, align 8, !dbg !1205
  %.pre = and i32 %flags, 3, !dbg !1206
  br label %bb19, !dbg !1205

bb19:                                             ; preds = %bb18, %bb14
  %.pre-phi = phi i32 [ %.pre, %bb18 ], [ %40, %bb14 ]
  %75 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %6, i32 1, !dbg !1207
  store i32 1, i32* %75, align 4, !dbg !1207
  switch i32 %.pre-phi, label %bb23 [
    i32 0, label %bb20
    i32 1, label %bb22
  ]

bb20:                                             ; preds = %bb19
  store i32 5, i32* %75, align 4, !dbg !1208
  br label %bb25, !dbg !1208

bb22:                                             ; preds = %bb19
  store i32 9, i32* %75, align 4, !dbg !1209
  br label %bb25, !dbg !1209

bb23:                                             ; preds = %bb19
  store i32 13, i32* %75, align 4, !dbg !1210
  br label %bb25, !dbg !1210

bb25:                                             ; preds = %bb20, %bb22, %bb23, %bb17, %bb13, %bb11, %bb8, %bb4
  %.0 = phi i32 [ -1, %bb4 ], [ -1, %bb8 ], [ -1, %bb11 ], [ -1, %bb13 ], [ -1, %bb17 ], [ %fd.0, %bb23 ], [ %fd.0, %bb22 ], [ %fd.0, %bb20 ]
  ret i32 %.0, !dbg !1159
}

define i32 @__fd_openat(i32 %basefd, i8* %pathname, i32 %flags, i32 %mode) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %basefd}, i64 0, metadata !451), !dbg !1211
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !452), !dbg !1211
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !453), !dbg !1211
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !454), !dbg !1211
  %0 = icmp eq i32 %basefd, -100, !dbg !1212
  br i1 %0, label %bb5, label %bb, !dbg !1212

bb:                                               ; preds = %entry
  tail call void @llvm.dbg.value(metadata !{i32 %basefd}, i64 0, metadata !273), !dbg !1213
  %1 = icmp ult i32 %basefd, 32, !dbg !1215
  br i1 %1, label %bb.i, label %bb1, !dbg !1215

bb.i:                                             ; preds = %bb
  %2 = sext i32 %basefd to i64, !dbg !1216
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !1216
  %3 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %2, i32 1, !dbg !1217
  %4 = load i32* %3, align 4, !dbg !1217
  %5 = and i32 %4, 1
  %toBool.i = icmp eq i32 %5, 0, !dbg !1217
  br i1 %toBool.i, label %bb1, label %__get_file.exit, !dbg !1217

__get_file.exit:                                  ; preds = %bb.i
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %2, !dbg !1216
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %6}, i64 0, metadata !459), !dbg !1214
  %7 = icmp eq %struct.exe_file_t* %6, null, !dbg !1218
  br i1 %7, label %bb1, label %bb2, !dbg !1218

bb1:                                              ; preds = %bb, %bb.i, %__get_file.exit
  %8 = tail call i32* @__errno_location() nounwind readnone, !dbg !1219
  store i32 9, i32* %8, align 4, !dbg !1219
  br label %bb21, !dbg !1220

bb2:                                              ; preds = %__get_file.exit
  %9 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %2, i32 3, !dbg !1221
  %10 = load %struct.exe_disk_file_t** %9, align 8, !dbg !1221
  %11 = icmp eq %struct.exe_disk_file_t* %10, null, !dbg !1221
  br i1 %11, label %bb4, label %bb3, !dbg !1221

bb3:                                              ; preds = %bb2
  tail call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str6, i64 0, i64 0)) nounwind, !dbg !1222
  %12 = tail call i32* @__errno_location() nounwind readnone, !dbg !1223
  store i32 2, i32* %12, align 4, !dbg !1223
  br label %bb21, !dbg !1224

bb4:                                              ; preds = %bb2
  %13 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %2, i32 0, !dbg !1225
  %14 = load i32* %13, align 8, !dbg !1225
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !451), !dbg !1225
  %phitmp = sext i32 %14 to i64
  br label %bb5, !dbg !1225

bb5:                                              ; preds = %entry, %bb4
  %basefd_addr.0 = phi i64 [ %phitmp, %bb4 ], [ -100, %entry ]
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !267), !dbg !1226
  %15 = load i8* %pathname, align 1, !dbg !1228
  tail call void @llvm.dbg.value(metadata !{i8 %15}, i64 0, metadata !268), !dbg !1228
  %16 = icmp eq i8 %15, 0, !dbg !1229
  br i1 %16, label %bb10, label %bb.i25, !dbg !1229

bb.i25:                                           ; preds = %bb5
  %17 = getelementptr inbounds i8* %pathname, i64 1, !dbg !1229
  %18 = load i8* %17, align 1, !dbg !1229
  %19 = icmp eq i8 %18, 0, !dbg !1229
  br i1 %19, label %bb8.preheader.i, label %bb10, !dbg !1229

bb8.preheader.i:                                  ; preds = %bb.i25
  %20 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1230
  %21 = sext i8 %15 to i32, !dbg !1231
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %33, 24
  %22 = ashr exact i32 %sext.i, 24, !dbg !1231
  %23 = add nsw i32 %22, 65, !dbg !1231
  %24 = icmp eq i32 %21, %23, !dbg !1231
  br i1 %24, label %bb4.i26, label %bb7.i, !dbg !1231

bb4.i26:                                          ; preds = %bb3.i
  %25 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1232
  %26 = zext i32 %33 to i64, !dbg !1232
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !271), !dbg !1232
  %27 = getelementptr inbounds %struct.exe_disk_file_t* %25, i64 %26, i32 2, !dbg !1233
  %28 = load %struct.stat** %27, align 8, !dbg !1233
  %29 = getelementptr inbounds %struct.stat* %28, i64 0, i32 1, !dbg !1233
  %30 = load i64* %29, align 8, !dbg !1233
  %31 = icmp eq i64 %30, 0, !dbg !1233
  br i1 %31, label %bb10, label %__get_sym_file.exit, !dbg !1233

bb7.i:                                            ; preds = %bb3.i
  %32 = add i32 %33, 1, !dbg !1230
  br label %bb8.i, !dbg !1230

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %33 = phi i32 [ %32, %bb7.i ], [ 0, %bb8.preheader.i ]
  %34 = icmp ugt i32 %20, %33, !dbg !1230
  br i1 %34, label %bb3.i, label %bb10, !dbg !1230

__get_sym_file.exit:                              ; preds = %bb4.i26
  %35 = getelementptr inbounds %struct.exe_disk_file_t* %25, i64 %26, !dbg !1232
  %36 = icmp eq %struct.exe_disk_file_t* %35, null, !dbg !1227
  br i1 %36, label %bb10, label %bb6, !dbg !1227

bb6:                                              ; preds = %__get_sym_file.exit
  %37 = tail call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode) nounwind, !dbg !1234
  br label %bb21, !dbg !1234

bb8:                                              ; preds = %bb10
  %scevgep = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar, i32 1
  %38 = load i32* %scevgep, align 4, !dbg !1235
  %39 = and i32 %38, 1, !dbg !1235
  %40 = icmp eq i32 %39, 0, !dbg !1235
  br i1 %40, label %bb13, label %bb9, !dbg !1235

bb9:                                              ; preds = %bb8
  %indvar.next = add i64 %indvar, 1
  br label %bb10, !dbg !1236

bb10:                                             ; preds = %bb4.i26, %bb5, %bb.i25, %__get_sym_file.exit, %bb8.i, %bb9
  %indvar = phi i64 [ %indvar.next, %bb9 ], [ 0, %bb8.i ], [ 0, %__get_sym_file.exit ], [ 0, %bb.i25 ], [ 0, %bb5 ], [ 0, %bb4.i26 ]
  %fd.0 = trunc i64 %indvar to i32
  %41 = icmp slt i32 %fd.0, 32, !dbg !1236
  br i1 %41, label %bb8, label %bb11, !dbg !1236

bb11:                                             ; preds = %bb10
  %42 = icmp eq i32 %fd.0, 32, !dbg !1237
  br i1 %42, label %bb12, label %bb13, !dbg !1237

bb12:                                             ; preds = %bb11
  %43 = tail call i32* @__errno_location() nounwind readnone, !dbg !1238
  store i32 24, i32* %43, align 4, !dbg !1238
  br label %bb21, !dbg !1239

bb13:                                             ; preds = %bb8, %bb11
  %44 = sext i32 %fd.0 to i64, !dbg !1240
  %45 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %44, !dbg !1240
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %45}, i64 0, metadata !455), !dbg !1240
  %46 = bitcast %struct.exe_file_t* %45 to i8*, !dbg !1241
  tail call void @llvm.memset.p0i8.i64(i8* %46, i8 0, i64 24, i32 8, i1 false), !dbg !1241
  %47 = sext i32 %flags to i64, !dbg !1242
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !354) nounwind, !dbg !1243
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !344) nounwind, !dbg !1244
  %48 = ptrtoint i8* %pathname to i64, !dbg !1246
  %49 = tail call i64 @klee_get_valuel(i64 %48) nounwind, !dbg !1246
  %50 = inttoptr i64 %49 to i8*, !dbg !1246
  tail call void @llvm.dbg.value(metadata !{i8* %50}, i64 0, metadata !345) nounwind, !dbg !1246
  %51 = icmp eq i8* %50, %pathname, !dbg !1247
  %52 = zext i1 %51 to i64, !dbg !1247
  tail call void @klee_assume(i64 %52) nounwind, !dbg !1247
  tail call void @llvm.dbg.value(metadata !{i8* %50}, i64 0, metadata !355) nounwind, !dbg !1245
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !357) nounwind, !dbg !1248
  br label %bb.i23, !dbg !1248

bb.i23:                                           ; preds = %bb6.i, %bb13
  %sc.0.i = phi i8* [ %50, %bb13 ], [ %sc.1.i, %bb6.i ]
  %53 = phi i32 [ 0, %bb13 ], [ %65, %bb6.i ]
  %tmp.i = add i32 %53, -1
  %54 = load i8* %sc.0.i, align 1, !dbg !1249
  %55 = and i32 %tmp.i, %53, !dbg !1250
  %56 = icmp eq i32 %55, 0, !dbg !1250
  br i1 %56, label %bb1.i24, label %bb5.i, !dbg !1250

bb1.i24:                                          ; preds = %bb.i23
  switch i8 %54, label %bb6.i [
    i8 0, label %bb2.i
    i8 47, label %bb4.i
  ]

bb2.i:                                            ; preds = %bb1.i24
  tail call void @llvm.dbg.value(metadata !{i8 %54}, i64 0, metadata !358) nounwind, !dbg !1249
  store i8 0, i8* %sc.0.i, align 1, !dbg !1251
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !355) nounwind, !dbg !1251
  br label %__concretize_string.exit, !dbg !1251

bb4.i:                                            ; preds = %bb1.i24
  store i8 47, i8* %sc.0.i, align 1, !dbg !1252
  %57 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1252
  br label %bb6.i, !dbg !1252

bb5.i:                                            ; preds = %bb.i23
  %58 = sext i8 %54 to i64, !dbg !1253
  %59 = tail call i64 @klee_get_valuel(i64 %58) nounwind, !dbg !1253
  %60 = trunc i64 %59 to i8, !dbg !1253
  %61 = icmp eq i8 %60, %54, !dbg !1254
  %62 = zext i1 %61 to i64, !dbg !1254
  tail call void @klee_assume(i64 %62) nounwind, !dbg !1254
  store i8 %60, i8* %sc.0.i, align 1, !dbg !1255
  %63 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1255
  %64 = icmp eq i8 %60, 0, !dbg !1256
  br i1 %64, label %__concretize_string.exit, label %bb6.i, !dbg !1256

bb6.i:                                            ; preds = %bb5.i, %bb4.i, %bb1.i24
  %sc.1.i = phi i8* [ %57, %bb4.i ], [ %63, %bb5.i ], [ %sc.0.i, %bb1.i24 ]
  %65 = add i32 %53, 1, !dbg !1248
  br label %bb.i23, !dbg !1248

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %66 = tail call i64 (i64, ...)* @syscall(i64 257, i64 %basefd_addr.0, i8* %pathname, i64 %47, i32 %mode) nounwind, !dbg !1242
  %67 = trunc i64 %66 to i32, !dbg !1242
  tail call void @llvm.dbg.value(metadata !{i32 %67}, i64 0, metadata !458), !dbg !1242
  %68 = icmp eq i32 %67, -1, !dbg !1257
  br i1 %68, label %bb14, label %bb15, !dbg !1257

bb14:                                             ; preds = %__concretize_string.exit
  %69 = tail call i32* @__errno_location() nounwind readnone, !dbg !1258
  %70 = tail call i32 @klee_get_errno() nounwind, !dbg !1258
  store i32 %70, i32* %69, align 4, !dbg !1258
  br label %bb21, !dbg !1259

bb15:                                             ; preds = %__concretize_string.exit
  %71 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %44, i32 0, !dbg !1260
  store i32 %67, i32* %71, align 8, !dbg !1260
  %72 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %44, i32 1, !dbg !1261
  store i32 1, i32* %72, align 4, !dbg !1261
  %73 = and i32 %flags, 3, !dbg !1262
  switch i32 %73, label %bb19 [
    i32 0, label %bb16
    i32 1, label %bb18
  ]

bb16:                                             ; preds = %bb15
  store i32 5, i32* %72, align 4, !dbg !1263
  br label %bb21, !dbg !1263

bb18:                                             ; preds = %bb15
  store i32 9, i32* %72, align 4, !dbg !1264
  br label %bb21, !dbg !1264

bb19:                                             ; preds = %bb15
  store i32 13, i32* %72, align 4, !dbg !1265
  br label %bb21, !dbg !1265

bb21:                                             ; preds = %bb16, %bb18, %bb19, %bb14, %bb12, %bb6, %bb3, %bb1
  %.0 = phi i32 [ -1, %bb1 ], [ -1, %bb3 ], [ %37, %bb6 ], [ -1, %bb12 ], [ -1, %bb14 ], [ %fd.0, %bb19 ], [ %fd.0, %bb18 ], [ %fd.0, %bb16 ]
  ret i32 %.0, !dbg !1220
}

define i32 @fcntl(i32 %fd, i32 %cmd, ...) nounwind {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 8
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !461), !dbg !1266
  call void @llvm.dbg.value(metadata !{i32 %cmd}, i64 0, metadata !462), !dbg !1266
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !465), !dbg !1267
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !273), !dbg !1268
  %0 = icmp ult i32 %fd, 32, !dbg !1270
  br i1 %0, label %bb.i, label %bb, !dbg !1270

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !1271
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !1271
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1, !dbg !1272
  %3 = load i32* %2, align 4, !dbg !1272
  %4 = and i32 %3, 1
  %toBool.i = icmp eq i32 %4, 0, !dbg !1272
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1272

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, !dbg !1271
  call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !463), !dbg !1269
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !1273
  br i1 %6, label %bb, label %bb1, !dbg !1273

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = call i32* @__errno_location() nounwind readnone, !dbg !1274
  store i32 9, i32* %7, align 4, !dbg !1274
  br label %bb35, !dbg !1275

bb1:                                              ; preds = %__get_file.exit
  switch i32 %cmd, label %bb8 [
    i32 3, label %bb21
    i32 1, label %bb21
    i32 11, label %bb21
    i32 9, label %bb21
  ]

bb8:                                              ; preds = %bb1
  %cmd.off = add i32 %cmd, -1025
  %8 = icmp ult i32 %cmd.off, 2
  br i1 %8, label %bb21, label %bb13, !dbg !1276

bb13:                                             ; preds = %bb8
  %ap1415 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !1277
  call void @llvm.va_start(i8* %ap1415), !dbg !1277
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !1278
  %10 = load i32* %9, align 8, !dbg !1278
  %11 = icmp ugt i32 %10, 47, !dbg !1278
  br i1 %11, label %bb17, label %bb16, !dbg !1278

bb16:                                             ; preds = %bb13
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !1278
  %13 = load i8** %12, align 8, !dbg !1278
  %tmp = zext i32 %10 to i64
  %14 = ptrtoint i8* %13 to i64, !dbg !1278
  %15 = add i64 %14, %tmp, !dbg !1278
  %16 = inttoptr i64 %15 to i8*, !dbg !1278
  %17 = add i32 %10, 8, !dbg !1278
  store i32 %17, i32* %9, align 8, !dbg !1278
  br label %bb18, !dbg !1278

bb17:                                             ; preds = %bb13
  %18 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !1278
  %19 = load i8** %18, align 8, !dbg !1278
  %20 = getelementptr inbounds i8* %19, i64 8, !dbg !1278
  store i8* %20, i8** %18, align 8, !dbg !1278
  br label %bb18, !dbg !1278

bb18:                                             ; preds = %bb17, %bb16
  %addr.49.0 = phi i8* [ %19, %bb17 ], [ %16, %bb16 ]
  %21 = bitcast i8* %addr.49.0 to i32*, !dbg !1278
  %22 = load i32* %21, align 4, !dbg !1278
  call void @llvm.dbg.value(metadata !{i32 %22}, i64 0, metadata !478), !dbg !1278
  call void @llvm.va_end(i8* %ap1415), !dbg !1279
  br label %bb21, !dbg !1279

bb21:                                             ; preds = %bb1, %bb1, %bb1, %bb1, %bb8, %bb18
  %arg.0 = phi i32 [ %22, %bb18 ], [ 0, %bb1 ], [ 0, %bb1 ], [ 0, %bb8 ], [ 0, %bb1 ], [ 0, %bb1 ]
  %23 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3, !dbg !1280
  %24 = load %struct.exe_disk_file_t** %23, align 8, !dbg !1280
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !1280
  br i1 %25, label %bb32, label %bb22, !dbg !1280

bb22:                                             ; preds = %bb21
  switch i32 %cmd, label %bb31 [
    i32 1, label %bb23
    i32 2, label %bb26
    i32 3, label %bb35
  ], !dbg !1281

bb23:                                             ; preds = %bb22
  call void @llvm.dbg.value(metadata !625, i64 0, metadata !479), !dbg !1282
  %26 = load i32* %2, align 4, !dbg !1283
  call void @llvm.dbg.value(metadata !1284, i64 0, metadata !479), !dbg !1285
  %27 = lshr i32 %26, 1
  %.lobit = and i32 %27, 1
  br label %bb35

bb26:                                             ; preds = %bb22
  %28 = load i32* %2, align 4, !dbg !1286
  %29 = and i32 %28, -3, !dbg !1286
  store i32 %29, i32* %2, align 4, !dbg !1286
  %30 = and i32 %arg.0, 1
  %toBool27 = icmp eq i32 %30, 0, !dbg !1287
  br i1 %toBool27, label %bb35, label %bb28, !dbg !1287

bb28:                                             ; preds = %bb26
  %31 = or i32 %28, 2, !dbg !1288
  store i32 %31, i32* %2, align 4, !dbg !1288
  br label %bb35, !dbg !1288

bb31:                                             ; preds = %bb22
  call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str8, i64 0, i64 0)) nounwind, !dbg !1289
  %32 = call i32* @__errno_location() nounwind readnone, !dbg !1290
  store i32 22, i32* %32, align 4, !dbg !1290
  br label %bb35, !dbg !1291

bb32:                                             ; preds = %bb21
  %33 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0, !dbg !1292
  %34 = load i32* %33, align 8, !dbg !1292
  %35 = call i64 (i64, ...)* @syscall(i64 72, i32 %34, i32 %cmd, i32 %arg.0) nounwind, !dbg !1292
  %36 = trunc i64 %35 to i32, !dbg !1292
  call void @llvm.dbg.value(metadata !{i32 %36}, i64 0, metadata !481), !dbg !1292
  %37 = icmp eq i32 %36, -1, !dbg !1293
  br i1 %37, label %bb33, label %bb35, !dbg !1293

bb33:                                             ; preds = %bb32
  %38 = call i32* @__errno_location() nounwind readnone, !dbg !1294
  %39 = call i32 @klee_get_errno() nounwind, !dbg !1294
  store i32 %39, i32* %38, align 4, !dbg !1294
  br label %bb35, !dbg !1294

bb35:                                             ; preds = %bb32, %bb33, %bb22, %bb28, %bb26, %bb23, %bb31, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb31 ], [ %.lobit, %bb23 ], [ 0, %bb26 ], [ 0, %bb28 ], [ 0, %bb22 ], [ -1, %bb33 ], [ %36, %bb32 ]
  ret i32 %.0, !dbg !1275
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @ioctl(i32 %fd, i64 %request, ...) nounwind {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 8
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !483), !dbg !1295
  call void @llvm.dbg.value(metadata !{i64 %request}, i64 0, metadata !484), !dbg !1295
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !487), !dbg !1296
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !273), !dbg !1297
  %0 = icmp ult i32 %fd, 32, !dbg !1299
  br i1 %0, label %bb.i, label %bb, !dbg !1299

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !1300
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !1300
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1, !dbg !1301
  %3 = load i32* %2, align 4, !dbg !1301
  %4 = and i32 %3, 1
  %toBool.i = icmp eq i32 %4, 0, !dbg !1301
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1301

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, !dbg !1300
  call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !485), !dbg !1298
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !1302
  br i1 %6, label %bb, label %bb1, !dbg !1302

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = call i32* @__errno_location() nounwind readnone, !dbg !1303
  store i32 9, i32* %7, align 4, !dbg !1303
  br label %bb39, !dbg !1304

bb1:                                              ; preds = %__get_file.exit
  %ap23 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !1305
  call void @llvm.va_start(i8* %ap23), !dbg !1305
  %8 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !1306
  %9 = load i32* %8, align 8, !dbg !1306
  %10 = icmp ugt i32 %9, 47, !dbg !1306
  br i1 %10, label %bb5, label %bb4, !dbg !1306

bb4:                                              ; preds = %bb1
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !1306
  %12 = load i8** %11, align 8, !dbg !1306
  %tmp = zext i32 %9 to i64
  %13 = ptrtoint i8* %12 to i64, !dbg !1306
  %14 = add i64 %13, %tmp, !dbg !1306
  %15 = inttoptr i64 %14 to i8*, !dbg !1306
  %16 = add i32 %9, 8, !dbg !1306
  store i32 %16, i32* %8, align 8, !dbg !1306
  br label %bb6, !dbg !1306

bb5:                                              ; preds = %bb1
  %17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !1306
  %18 = load i8** %17, align 8, !dbg !1306
  %19 = getelementptr inbounds i8* %18, i64 8, !dbg !1306
  store i8* %19, i8** %17, align 8, !dbg !1306
  br label %bb6, !dbg !1306

bb6:                                              ; preds = %bb5, %bb4
  %addr.47.0 = phi i8* [ %18, %bb5 ], [ %15, %bb4 ]
  %20 = bitcast i8* %addr.47.0 to i8**, !dbg !1306
  %21 = load i8** %20, align 8, !dbg !1306
  call void @llvm.dbg.value(metadata !{i8* %21}, i64 0, metadata !488), !dbg !1306
  call void @llvm.va_end(i8* %ap23), !dbg !1307
  %22 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3, !dbg !1308
  %23 = load %struct.exe_disk_file_t** %22, align 8, !dbg !1308
  %24 = icmp eq %struct.exe_disk_file_t* %23, null, !dbg !1308
  br i1 %24, label %bb36, label %bb9, !dbg !1308

bb9:                                              ; preds = %bb6
  %25 = getelementptr inbounds %struct.exe_disk_file_t* %23, i64 0, i32 2, !dbg !1309
  %26 = load %struct.stat** %25, align 8, !dbg !1309
  call void @llvm.dbg.value(metadata !{%struct.stat* %26}, i64 0, metadata !489), !dbg !1309
  switch i64 %request, label %bb35 [
    i64 21505, label %bb10
    i64 21506, label %bb13
    i64 21507, label %bb16
    i64 21508, label %bb19
    i64 21523, label %bb22
    i64 21524, label %bb25
    i64 21531, label %bb28
    i64 2150657282, label %bb34
  ], !dbg !1310

bb10:                                             ; preds = %bb9
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !491), !dbg !1311
  call void @klee_warning_once(i8* getelementptr inbounds ([41 x i8]* @.str9, i64 0, i64 0)) nounwind, !dbg !1312
  %27 = getelementptr inbounds %struct.stat* %26, i64 0, i32 3, !dbg !1313
  %28 = load i32* %27, align 8, !dbg !1313
  %29 = and i32 %28, 61440, !dbg !1313
  %30 = icmp eq i32 %29, 8192, !dbg !1313
  br i1 %30, label %bb11, label %bb12, !dbg !1313

bb11:                                             ; preds = %bb10
  %31 = bitcast i8* %21 to i32*, !dbg !1314
  store i32 27906, i32* %31, align 4, !dbg !1314
  %32 = getelementptr inbounds i8* %21, i64 4
  %33 = bitcast i8* %32 to i32*, !dbg !1315
  store i32 5, i32* %33, align 4, !dbg !1315
  %34 = getelementptr inbounds i8* %21, i64 8
  %35 = bitcast i8* %34 to i32*, !dbg !1316
  store i32 1215, i32* %35, align 4, !dbg !1316
  %36 = getelementptr inbounds i8* %21, i64 12
  %37 = bitcast i8* %36 to i32*, !dbg !1317
  store i32 35287, i32* %37, align 4, !dbg !1317
  %38 = getelementptr inbounds i8* %21, i64 16
  store i8 0, i8* %38, align 4, !dbg !1318
  %39 = getelementptr inbounds i8* %21, i64 17
  store i8 3, i8* %39, align 1, !dbg !1319
  %40 = getelementptr inbounds i8* %21, i64 18, !dbg !1320
  store i8 28, i8* %40, align 1, !dbg !1320
  %41 = getelementptr inbounds i8* %21, i64 19, !dbg !1321
  store i8 127, i8* %41, align 1, !dbg !1321
  %42 = getelementptr inbounds i8* %21, i64 20, !dbg !1322
  store i8 21, i8* %42, align 1, !dbg !1322
  %43 = getelementptr inbounds i8* %21, i64 21, !dbg !1323
  store i8 4, i8* %43, align 1, !dbg !1323
  %44 = getelementptr inbounds i8* %21, i64 22, !dbg !1324
  store i8 0, i8* %44, align 1, !dbg !1324
  %45 = getelementptr inbounds i8* %21, i64 23, !dbg !1325
  store i8 1, i8* %45, align 1, !dbg !1325
  %46 = getelementptr inbounds i8* %21, i64 24, !dbg !1326
  store i8 -1, i8* %46, align 1, !dbg !1326
  %47 = getelementptr inbounds i8* %21, i64 25, !dbg !1327
  store i8 17, i8* %47, align 1, !dbg !1327
  %48 = getelementptr inbounds i8* %21, i64 26, !dbg !1328
  store i8 19, i8* %48, align 1, !dbg !1328
  %49 = getelementptr inbounds i8* %21, i64 27, !dbg !1329
  store i8 26, i8* %49, align 1, !dbg !1329
  %50 = getelementptr inbounds i8* %21, i64 28, !dbg !1330
  store i8 -1, i8* %50, align 1, !dbg !1330
  %51 = getelementptr inbounds i8* %21, i64 29, !dbg !1331
  store i8 18, i8* %51, align 1, !dbg !1331
  %52 = getelementptr inbounds i8* %21, i64 30, !dbg !1332
  store i8 15, i8* %52, align 1, !dbg !1332
  %53 = getelementptr inbounds i8* %21, i64 31, !dbg !1333
  store i8 23, i8* %53, align 1, !dbg !1333
  %54 = getelementptr inbounds i8* %21, i64 32, !dbg !1334
  store i8 22, i8* %54, align 1, !dbg !1334
  %55 = getelementptr inbounds i8* %21, i64 33, !dbg !1335
  store i8 -1, i8* %55, align 1, !dbg !1335
  %56 = getelementptr inbounds i8* %21, i64 34, !dbg !1336
  store i8 0, i8* %56, align 1, !dbg !1336
  %57 = getelementptr inbounds i8* %21, i64 35, !dbg !1337
  store i8 0, i8* %57, align 1, !dbg !1337
  br label %bb39, !dbg !1338

bb12:                                             ; preds = %bb10
  %58 = call i32* @__errno_location() nounwind readnone, !dbg !1339
  store i32 25, i32* %58, align 4, !dbg !1339
  br label %bb39, !dbg !1340

bb13:                                             ; preds = %bb9
  call void @klee_warning_once(i8* getelementptr inbounds ([42 x i8]* @.str10, i64 0, i64 0)) nounwind, !dbg !1341
  %59 = getelementptr inbounds %struct.stat* %26, i64 0, i32 3, !dbg !1342
  %60 = load i32* %59, align 8, !dbg !1342
  %61 = and i32 %60, 61440, !dbg !1342
  %62 = icmp eq i32 %61, 8192, !dbg !1342
  br i1 %62, label %bb39, label %bb15, !dbg !1342

bb15:                                             ; preds = %bb13
  %63 = call i32* @__errno_location() nounwind readnone, !dbg !1343
  store i32 25, i32* %63, align 4, !dbg !1343
  br label %bb39, !dbg !1344

bb16:                                             ; preds = %bb9
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str11, i64 0, i64 0)) nounwind, !dbg !1345
  %64 = icmp eq i32 %fd, 0, !dbg !1346
  br i1 %64, label %bb39, label %bb18, !dbg !1346

bb18:                                             ; preds = %bb16
  %65 = call i32* @__errno_location() nounwind readnone, !dbg !1347
  store i32 25, i32* %65, align 4, !dbg !1347
  br label %bb39, !dbg !1348

bb19:                                             ; preds = %bb9
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str12, i64 0, i64 0)) nounwind, !dbg !1349
  %66 = getelementptr inbounds %struct.stat* %26, i64 0, i32 3, !dbg !1350
  %67 = load i32* %66, align 8, !dbg !1350
  %68 = and i32 %67, 61440, !dbg !1350
  %69 = icmp eq i32 %68, 8192, !dbg !1350
  br i1 %69, label %bb39, label %bb21, !dbg !1350

bb21:                                             ; preds = %bb19
  %70 = call i32* @__errno_location() nounwind readnone, !dbg !1351
  store i32 25, i32* %70, align 4, !dbg !1351
  br label %bb39, !dbg !1352

bb22:                                             ; preds = %bb9
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !511), !dbg !1353
  %71 = bitcast i8* %21 to i16*, !dbg !1354
  store i16 24, i16* %71, align 2, !dbg !1354
  %72 = getelementptr inbounds i8* %21, i64 2
  %73 = bitcast i8* %72 to i16*, !dbg !1355
  store i16 80, i16* %73, align 2, !dbg !1355
  call void @klee_warning_once(i8* getelementptr inbounds ([45 x i8]* @.str13, i64 0, i64 0)) nounwind, !dbg !1356
  %74 = getelementptr inbounds %struct.stat* %26, i64 0, i32 3, !dbg !1357
  %75 = load i32* %74, align 8, !dbg !1357
  %76 = and i32 %75, 61440, !dbg !1357
  %77 = icmp eq i32 %76, 8192, !dbg !1357
  br i1 %77, label %bb39, label %bb24, !dbg !1357

bb24:                                             ; preds = %bb22
  %78 = call i32* @__errno_location() nounwind readnone, !dbg !1358
  store i32 25, i32* %78, align 4, !dbg !1358
  br label %bb39, !dbg !1359

bb25:                                             ; preds = %bb9
  call void @klee_warning_once(i8* getelementptr inbounds ([46 x i8]* @.str14, i64 0, i64 0)) nounwind, !dbg !1360
  %79 = getelementptr inbounds %struct.stat* %26, i64 0, i32 3, !dbg !1361
  %80 = load i32* %79, align 8, !dbg !1361
  %81 = and i32 %80, 61440, !dbg !1361
  %82 = icmp eq i32 %81, 8192, !dbg !1361
  %83 = call i32* @__errno_location() nounwind readnone, !dbg !1362
  br i1 %82, label %bb26, label %bb27, !dbg !1361

bb26:                                             ; preds = %bb25
  store i32 22, i32* %83, align 4, !dbg !1362
  br label %bb39, !dbg !1363

bb27:                                             ; preds = %bb25
  store i32 25, i32* %83, align 4, !dbg !1364
  br label %bb39, !dbg !1365

bb28:                                             ; preds = %bb9
  %84 = bitcast i8* %21 to i32*, !dbg !1366
  call void @llvm.dbg.value(metadata !{i32* %84}, i64 0, metadata !521), !dbg !1366
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str15, i64 0, i64 0)) nounwind, !dbg !1367
  %85 = getelementptr inbounds %struct.stat* %26, i64 0, i32 3, !dbg !1368
  %86 = load i32* %85, align 8, !dbg !1368
  %87 = and i32 %86, 61440, !dbg !1368
  %88 = icmp eq i32 %87, 8192, !dbg !1368
  br i1 %88, label %bb29, label %bb33, !dbg !1368

bb29:                                             ; preds = %bb28
  %89 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 2, !dbg !1369
  %90 = load i64* %89, align 8, !dbg !1369
  %91 = load %struct.exe_disk_file_t** %22, align 8, !dbg !1369
  %92 = getelementptr inbounds %struct.exe_disk_file_t* %91, i64 0, i32 0, !dbg !1369
  %93 = load i32* %92, align 8, !dbg !1369
  %94 = zext i32 %93 to i64, !dbg !1369
  %95 = icmp slt i64 %90, %94, !dbg !1369
  br i1 %95, label %bb30, label %bb32, !dbg !1369

bb30:                                             ; preds = %bb29
  %96 = trunc i64 %90 to i32, !dbg !1370
  %97 = sub i32 %93, %96, !dbg !1370
  br label %bb32, !dbg !1370

bb32:                                             ; preds = %bb29, %bb30
  %storemerge = phi i32 [ %97, %bb30 ], [ 0, %bb29 ]
  store i32 %storemerge, i32* %84, align 4
  br label %bb39, !dbg !1371

bb33:                                             ; preds = %bb28
  %98 = call i32* @__errno_location() nounwind readnone, !dbg !1372
  store i32 25, i32* %98, align 4, !dbg !1372
  br label %bb39, !dbg !1373

bb34:                                             ; preds = %bb9
  call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str16, i64 0, i64 0)) nounwind, !dbg !1374
  %99 = call i32* @__errno_location() nounwind readnone, !dbg !1375
  store i32 22, i32* %99, align 4, !dbg !1375
  br label %bb39, !dbg !1376

bb35:                                             ; preds = %bb9
  call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str8, i64 0, i64 0)) nounwind, !dbg !1377
  %100 = call i32* @__errno_location() nounwind readnone, !dbg !1378
  store i32 22, i32* %100, align 4, !dbg !1378
  br label %bb39, !dbg !1379

bb36:                                             ; preds = %bb6
  %101 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0, !dbg !1380
  %102 = load i32* %101, align 8, !dbg !1380
  %103 = call i64 (i64, ...)* @syscall(i64 16, i32 %102, i64 %request, i8* %21) nounwind, !dbg !1380
  %104 = trunc i64 %103 to i32, !dbg !1380
  call void @llvm.dbg.value(metadata !{i32 %104}, i64 0, metadata !524), !dbg !1380
  %105 = icmp eq i32 %104, -1, !dbg !1381
  br i1 %105, label %bb37, label %bb39, !dbg !1381

bb37:                                             ; preds = %bb36
  %106 = call i32* @__errno_location() nounwind readnone, !dbg !1382
  %107 = call i32 @klee_get_errno() nounwind, !dbg !1382
  store i32 %107, i32* %106, align 4, !dbg !1382
  br label %bb39, !dbg !1382

bb39:                                             ; preds = %bb36, %bb37, %bb22, %bb19, %bb16, %bb13, %bb35, %bb34, %bb33, %bb32, %bb27, %bb26, %bb24, %bb21, %bb18, %bb15, %bb12, %bb11, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb35 ], [ -1, %bb34 ], [ 0, %bb32 ], [ -1, %bb33 ], [ -1, %bb26 ], [ -1, %bb27 ], [ -1, %bb24 ], [ -1, %bb21 ], [ -1, %bb18 ], [ -1, %bb15 ], [ 0, %bb11 ], [ -1, %bb12 ], [ 0, %bb13 ], [ 0, %bb16 ], [ 0, %bb19 ], [ 0, %bb22 ], [ -1, %bb37 ], [ %104, %bb36 ]
  ret i32 %.0, !dbg !1304
}

declare void @klee_warning_once(i8*)

define i32 @__fd_getdents(i32 %fd, %struct.dirent64* %dirp, i32 %count) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !526), !dbg !1383
  tail call void @llvm.dbg.value(metadata !{%struct.dirent64* %dirp}, i64 0, metadata !527), !dbg !1383
  tail call void @llvm.dbg.value(metadata !{i32 %count}, i64 0, metadata !528), !dbg !1383
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !273), !dbg !1384
  %0 = icmp ult i32 %fd, 32, !dbg !1386
  br i1 %0, label %bb.i, label %bb, !dbg !1386

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !1387
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !1387
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1, !dbg !1388
  %3 = load i32* %2, align 4, !dbg !1388
  %4 = and i32 %3, 1
  %toBool.i = icmp eq i32 %4, 0, !dbg !1388
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1388

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, !dbg !1387
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !529), !dbg !1385
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !1389
  br i1 %6, label %bb, label %bb1, !dbg !1389

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !1390
  store i32 9, i32* %7, align 4, !dbg !1390
  br label %bb19, !dbg !1391

bb1:                                              ; preds = %__get_file.exit
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3, !dbg !1392
  %9 = load %struct.exe_disk_file_t** %8, align 8, !dbg !1392
  %10 = icmp eq %struct.exe_disk_file_t* %9, null, !dbg !1392
  br i1 %10, label %bb3, label %bb2, !dbg !1392

bb2:                                              ; preds = %bb1
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str8, i64 0, i64 0)) nounwind, !dbg !1393
  %11 = tail call i32* @__errno_location() nounwind readnone, !dbg !1394
  store i32 22, i32* %11, align 4, !dbg !1394
  br label %bb19, !dbg !1395

bb3:                                              ; preds = %bb1
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 2, !dbg !1396
  %13 = load i64* %12, align 8, !dbg !1396
  %14 = icmp ult i64 %13, 4096, !dbg !1396
  br i1 %14, label %bb4, label %bb11, !dbg !1396

bb4:                                              ; preds = %bb3
  tail call void @llvm.dbg.value(metadata !1397, i64 0, metadata !534), !dbg !1398
  %15 = udiv i64 %13, 280, !dbg !1399
  tail call void @llvm.dbg.value(metadata !{i64 %15}, i64 0, metadata !531), !dbg !1399
  %16 = mul i64 %15, 280, !dbg !1400
  %17 = icmp eq i64 %16, %13, !dbg !1400
  br i1 %17, label %bb5, label %bb6, !dbg !1400

bb5:                                              ; preds = %bb4
  %18 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1400
  %19 = zext i32 %18 to i64, !dbg !1400
  %20 = icmp ult i64 %19, %15, !dbg !1400
  br i1 %20, label %bb6, label %bb8.preheader, !dbg !1400

bb8.preheader:                                    ; preds = %bb5
  %21 = icmp ugt i64 %19, %15, !dbg !1401
  br i1 %21, label %bb7.lr.ph, label %bb9, !dbg !1401

bb7.lr.ph:                                        ; preds = %bb8.preheader
  %tmp39 = add i64 %15, 65
  %tmp48 = add i64 %16, 280
  %tmp50 = add i64 %15, 1
  br label %bb7

bb6:                                              ; preds = %bb4, %bb5
  %22 = tail call i32* @__errno_location() nounwind readnone, !dbg !1402
  store i32 22, i32* %22, align 4, !dbg !1402
  br label %bb19, !dbg !1403

bb7:                                              ; preds = %bb7.lr.ph, %bb7
  %indvar = phi i64 [ 0, %bb7.lr.ph ], [ %indvar.next, %bb7 ]
  %bytes.025 = phi i64 [ 0, %bb7.lr.ph ], [ %32, %bb7 ]
  %scevgep29 = getelementptr inbounds %struct.dirent64* %dirp, i64 %indvar, i32 0
  %scevgep30 = getelementptr %struct.dirent64* %dirp, i64 %indvar, i32 2
  %scevgep31 = getelementptr %struct.dirent64* %dirp, i64 %indvar, i32 3
  %scevgep32 = getelementptr %struct.dirent64* %dirp, i64 %indvar, i32 1
  %scevgep35 = getelementptr %struct.dirent64* %dirp, i64 %indvar, i32 4, i64 0
  %scevgep36 = getelementptr %struct.dirent64* %dirp, i64 %indvar, i32 4, i64 1
  %tmp41 = add i64 %tmp39, %indvar
  %tmp42 = trunc i64 %tmp41 to i8
  %tmp43 = add i64 %15, %indvar
  %tmp46 = mul i64 %indvar, 280
  %tmp49 = add i64 %tmp48, %tmp46
  %tmp51 = add i64 %tmp50, %indvar
  %23 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1404
  %scevgep45 = getelementptr %struct.exe_disk_file_t* %23, i64 %tmp43, i32 2
  %24 = load %struct.stat** %scevgep45, align 8, !dbg !1405
  %25 = getelementptr inbounds %struct.stat* %24, i64 0, i32 1, !dbg !1405
  %26 = load i64* %25, align 8, !dbg !1405
  store i64 %26, i64* %scevgep29, align 8, !dbg !1405
  store i16 280, i16* %scevgep30, align 8, !dbg !1406
  %27 = load %struct.stat** %scevgep45, align 8, !dbg !1407
  %28 = getelementptr inbounds %struct.stat* %27, i64 0, i32 3, !dbg !1407
  %29 = load i32* %28, align 8, !dbg !1407
  %30 = lshr i32 %29, 12
  %.tr = trunc i32 %30 to i8
  %31 = and i8 %.tr, 15, !dbg !1407
  store i8 %31, i8* %scevgep31, align 2, !dbg !1407
  store i8 %tmp42, i8* %scevgep35, align 1, !dbg !1408
  store i8 0, i8* %scevgep36, align 1, !dbg !1409
  store i64 %tmp49, i64* %scevgep32, align 8, !dbg !1410
  %32 = add nsw i64 %bytes.025, 280, !dbg !1411
  %33 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1401
  %34 = zext i32 %33 to i64, !dbg !1401
  %35 = icmp sgt i64 %34, %tmp51, !dbg !1401
  %indvar.next = add i64 %indvar, 1
  br i1 %35, label %bb7, label %bb8.bb9_crit_edge, !dbg !1401

bb8.bb9_crit_edge:                                ; preds = %bb7
  %scevgep34 = getelementptr %struct.dirent64* %dirp, i64 %indvar.next
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !535), !dbg !1404
  tail call void @llvm.dbg.value(metadata !{i64 %32}, i64 0, metadata !534), !dbg !1411
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !527), !dbg !1412
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !531), !dbg !1401
  br label %bb9

bb9:                                              ; preds = %bb8.bb9_crit_edge, %bb8.preheader
  %dirp_addr.0.lcssa = phi %struct.dirent64* [ %scevgep34, %bb8.bb9_crit_edge ], [ %dirp, %bb8.preheader ]
  %bytes.0.lcssa = phi i64 [ %32, %bb8.bb9_crit_edge ], [ 0, %bb8.preheader ]
  %36 = icmp ugt i32 %count, 4096, !dbg !1413
  %37 = zext i32 %count to i64
  %38 = select i1 %36, i64 4096, i64 %37, !dbg !1413
  tail call void @llvm.dbg.value(metadata !{i64 %38}, i64 0, metadata !533), !dbg !1413
  %39 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i64 0, i32 0, !dbg !1414
  store i64 0, i64* %39, align 8, !dbg !1414
  %40 = trunc i64 %38 to i16, !dbg !1415
  %41 = trunc i64 %bytes.0.lcssa to i16, !dbg !1415
  %42 = sub i16 %40, %41, !dbg !1415
  %43 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i64 0, i32 2, !dbg !1415
  store i16 %42, i16* %43, align 8, !dbg !1415
  %44 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i64 0, i32 3, !dbg !1416
  store i8 0, i8* %44, align 2, !dbg !1416
  %45 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i64 0, i32 4, i64 0, !dbg !1417
  store i8 0, i8* %45, align 1, !dbg !1417
  %46 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i64 0, i32 1, !dbg !1418
  store i64 4096, i64* %46, align 8, !dbg !1418
  %47 = zext i16 %42 to i64, !dbg !1419
  %48 = add nsw i64 %47, %bytes.0.lcssa, !dbg !1419
  tail call void @llvm.dbg.value(metadata !{i64 %48}, i64 0, metadata !534), !dbg !1419
  store i64 %38, i64* %12, align 8, !dbg !1420
  %49 = trunc i64 %48 to i32, !dbg !1421
  br label %bb19, !dbg !1421

bb11:                                             ; preds = %bb3
  %50 = add nsw i64 %13, -4096, !dbg !1422
  tail call void @llvm.dbg.value(metadata !{i64 %50}, i64 0, metadata !537), !dbg !1422
  tail call void @llvm.dbg.value(metadata !1397, i64 0, metadata !540), !dbg !1423
  %51 = zext i32 %count to i64, !dbg !1424
  %52 = bitcast %struct.dirent64* %dirp to i8*, !dbg !1424
  tail call void @llvm.memset.p0i8.i64(i8* %52, i8 0, i64 %51, i32 8, i1 false), !dbg !1424
  %53 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0, !dbg !1425
  %54 = load i32* %53, align 8, !dbg !1425
  %55 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %54, i64 %50, i32 0) nounwind, !dbg !1425
  tail call void @llvm.dbg.value(metadata !{i64 %55}, i64 0, metadata !540), !dbg !1425
  %56 = icmp eq i64 %55, -1, !dbg !1426
  br i1 %56, label %bb12, label %bb13, !dbg !1426

bb12:                                             ; preds = %bb11
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str18, i64 0, i64 0), i32 875, i8* getelementptr inbounds ([14 x i8]* @__PRETTY_FUNCTION__.5298, i64 0, i64 0)) noreturn nounwind, !dbg !1426
  unreachable, !dbg !1426

bb13:                                             ; preds = %bb11
  %57 = load i32* %53, align 8, !dbg !1427
  %58 = tail call i64 (i64, ...)* @syscall(i64 217, i32 %57, %struct.dirent64* %dirp, i32 %count) nounwind, !dbg !1427
  %59 = trunc i64 %58 to i32, !dbg !1427
  tail call void @llvm.dbg.value(metadata !{i32 %59}, i64 0, metadata !539), !dbg !1427
  %60 = icmp eq i32 %59, -1, !dbg !1428
  br i1 %60, label %bb14, label %bb15, !dbg !1428

bb14:                                             ; preds = %bb13
  %61 = tail call i32* @__errno_location() nounwind readnone, !dbg !1429
  %62 = tail call i32 @klee_get_errno() nounwind, !dbg !1429
  store i32 %62, i32* %61, align 4, !dbg !1429
  br label %bb19, !dbg !1429

bb15:                                             ; preds = %bb13
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !541), !dbg !1430
  %63 = load i32* %53, align 8, !dbg !1431
  %64 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %63, i32 0, i32 1) nounwind, !dbg !1431
  %65 = add nsw i64 %64, 4096, !dbg !1431
  store i64 %65, i64* %12, align 8, !dbg !1431
  %66 = icmp sgt i32 %59, 0, !dbg !1432
  br i1 %66, label %bb16, label %bb19, !dbg !1432

bb16:                                             ; preds = %bb15, %bb16
  %pos.023 = phi i32 [ %76, %bb16 ], [ 0, %bb15 ]
  %67 = sext i32 %pos.023 to i64, !dbg !1433
  %.sum = add i64 %67, 8
  %68 = getelementptr inbounds i8* %52, i64 %.sum
  %69 = bitcast i8* %68 to i64*, !dbg !1434
  %70 = load i64* %69, align 8, !dbg !1434
  %71 = add nsw i64 %70, 4096, !dbg !1434
  store i64 %71, i64* %69, align 8, !dbg !1434
  %.sum22 = add i64 %67, 16
  %72 = getelementptr inbounds i8* %52, i64 %.sum22
  %73 = bitcast i8* %72 to i16*, !dbg !1435
  %74 = load i16* %73, align 8, !dbg !1435
  %75 = zext i16 %74 to i32, !dbg !1435
  %76 = add nsw i32 %75, %pos.023, !dbg !1435
  %77 = icmp slt i32 %76, %59, !dbg !1432
  br i1 %77, label %bb16, label %bb19, !dbg !1432

bb19:                                             ; preds = %bb15, %bb16, %bb14, %bb9, %bb6, %bb2, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb2 ], [ -1, %bb6 ], [ %49, %bb9 ], [ -1, %bb14 ], [ %59, %bb16 ], [ %59, %bb15 ]
  ret i32 %.0, !dbg !1391
}

declare void @__assert_fail(i8*, i8*, i32, i8*) noreturn nounwind

define i64 @__fd_lseek(i32 %fd, i64 %offset, i32 %whence) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !545), !dbg !1436
  tail call void @llvm.dbg.value(metadata !{i64 %offset}, i64 0, metadata !546), !dbg !1436
  tail call void @llvm.dbg.value(metadata !{i32 %whence}, i64 0, metadata !547), !dbg !1436
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !273), !dbg !1437
  %0 = icmp ult i32 %fd, 32, !dbg !1439
  br i1 %0, label %bb.i, label %bb, !dbg !1439

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !1440
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !1440
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1, !dbg !1441
  %3 = load i32* %2, align 4, !dbg !1441
  %4 = and i32 %3, 1
  %toBool.i = icmp eq i32 %4, 0, !dbg !1441
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1441

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, !dbg !1440
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !550), !dbg !1438
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !1442
  br i1 %6, label %bb, label %bb1, !dbg !1442

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !1443
  store i32 9, i32* %7, align 4, !dbg !1443
  br label %bb19, !dbg !1444

bb1:                                              ; preds = %__get_file.exit
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3, !dbg !1445
  %9 = load %struct.exe_disk_file_t** %8, align 8, !dbg !1445
  %10 = icmp eq %struct.exe_disk_file_t* %9, null, !dbg !1445
  br i1 %10, label %bb2, label %bb11, !dbg !1445

bb2:                                              ; preds = %bb1
  %11 = icmp eq i32 %whence, 0, !dbg !1446
  br i1 %11, label %bb3, label %bb4, !dbg !1446

bb3:                                              ; preds = %bb2
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0, !dbg !1447
  %13 = load i32* %12, align 8, !dbg !1447
  %14 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %13, i64 %offset, i32 0) nounwind, !dbg !1447
  tail call void @llvm.dbg.value(metadata !{i64 %14}, i64 0, metadata !548), !dbg !1447
  br label %bb8, !dbg !1447

bb4:                                              ; preds = %bb2
  %15 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 2, !dbg !1448
  %16 = load i64* %15, align 8, !dbg !1448
  %17 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0, !dbg !1448
  %18 = load i32* %17, align 8, !dbg !1448
  %19 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %18, i64 %16, i32 0) nounwind, !dbg !1448
  tail call void @llvm.dbg.value(metadata !{i64 %19}, i64 0, metadata !548), !dbg !1448
  %20 = icmp eq i64 %19, -1, !dbg !1449
  br i1 %20, label %bb9, label %bb5, !dbg !1449

bb5:                                              ; preds = %bb4
  %21 = load i64* %15, align 8, !dbg !1450
  %22 = icmp eq i64 %21, %19, !dbg !1450
  br i1 %22, label %bb7, label %bb6, !dbg !1450

bb6:                                              ; preds = %bb5
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8]* @.str19, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str18, i64 0, i64 0), i32 499, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.5022, i64 0, i64 0)) noreturn nounwind, !dbg !1450
  unreachable, !dbg !1450

bb7:                                              ; preds = %bb5
  %23 = load i32* %17, align 8, !dbg !1451
  %24 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %23, i64 %offset, i32 %whence) nounwind, !dbg !1451
  tail call void @llvm.dbg.value(metadata !{i64 %24}, i64 0, metadata !548), !dbg !1451
  br label %bb8, !dbg !1451

bb8:                                              ; preds = %bb7, %bb3
  %new_off.0 = phi i64 [ %14, %bb3 ], [ %24, %bb7 ]
  %25 = icmp eq i64 %new_off.0, -1, !dbg !1452
  br i1 %25, label %bb9, label %bb10, !dbg !1452

bb9:                                              ; preds = %bb4, %bb8
  %26 = tail call i32* @__errno_location() nounwind readnone, !dbg !1453
  %27 = tail call i32 @klee_get_errno() nounwind, !dbg !1453
  store i32 %27, i32* %26, align 4, !dbg !1453
  br label %bb19, !dbg !1454

bb10:                                             ; preds = %bb8
  %28 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 2, !dbg !1455
  store i64 %new_off.0, i64* %28, align 8, !dbg !1455
  br label %bb19, !dbg !1456

bb11:                                             ; preds = %bb1
  switch i32 %whence, label %bb15 [
    i32 0, label %bb16
    i32 1, label %bb13
    i32 2, label %bb14
  ], !dbg !1457

bb13:                                             ; preds = %bb11
  %29 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 2, !dbg !1458
  %30 = load i64* %29, align 8, !dbg !1458
  %31 = add nsw i64 %30, %offset, !dbg !1458
  tail call void @llvm.dbg.value(metadata !{i64 %31}, i64 0, metadata !548), !dbg !1458
  br label %bb16, !dbg !1458

bb14:                                             ; preds = %bb11
  %32 = getelementptr inbounds %struct.exe_disk_file_t* %9, i64 0, i32 0, !dbg !1459
  %33 = load i32* %32, align 8, !dbg !1459
  %34 = zext i32 %33 to i64, !dbg !1459
  %35 = add nsw i64 %34, %offset, !dbg !1459
  tail call void @llvm.dbg.value(metadata !{i64 %35}, i64 0, metadata !548), !dbg !1459
  br label %bb16, !dbg !1459

bb15:                                             ; preds = %bb11
  %36 = tail call i32* @__errno_location() nounwind readnone, !dbg !1460
  store i32 22, i32* %36, align 4, !dbg !1460
  br label %bb19, !dbg !1461

bb16:                                             ; preds = %bb11, %bb14, %bb13
  %new_off.1 = phi i64 [ %35, %bb14 ], [ %31, %bb13 ], [ %offset, %bb11 ]
  %37 = icmp slt i64 %new_off.1, 0, !dbg !1462
  br i1 %37, label %bb17, label %bb18, !dbg !1462

bb17:                                             ; preds = %bb16
  %38 = tail call i32* @__errno_location() nounwind readnone, !dbg !1463
  store i32 22, i32* %38, align 4, !dbg !1463
  br label %bb19, !dbg !1464

bb18:                                             ; preds = %bb16
  %39 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 2, !dbg !1465
  store i64 %new_off.1, i64* %39, align 8, !dbg !1465
  br label %bb19, !dbg !1466

bb19:                                             ; preds = %bb18, %bb17, %bb15, %bb10, %bb9, %bb
  %.0 = phi i64 [ -1, %bb ], [ -1, %bb9 ], [ %new_off.0, %bb10 ], [ -1, %bb15 ], [ -1, %bb17 ], [ %new_off.1, %bb18 ]
  ret i64 %.0, !dbg !1444
}

define i32 @__fd_fstat(i32 %fd, %struct.stat* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !551), !dbg !1467
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !552), !dbg !1467
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !273), !dbg !1468
  %0 = icmp ult i32 %fd, 32, !dbg !1470
  br i1 %0, label %bb.i, label %bb, !dbg !1470

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !1471
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !1471
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1, !dbg !1472
  %3 = load i32* %2, align 4, !dbg !1472
  %4 = and i32 %3, 1
  %toBool.i = icmp eq i32 %4, 0, !dbg !1472
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1472

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, !dbg !1471
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !553), !dbg !1469
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !1473
  br i1 %6, label %bb, label %bb1, !dbg !1473

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !1474
  store i32 9, i32* %7, align 4, !dbg !1474
  br label %bb6, !dbg !1475

bb1:                                              ; preds = %__get_file.exit
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3, !dbg !1476
  %9 = load %struct.exe_disk_file_t** %8, align 8, !dbg !1476
  %10 = icmp eq %struct.exe_disk_file_t* %9, null, !dbg !1476
  br i1 %10, label %bb2, label %bb5, !dbg !1476

bb2:                                              ; preds = %bb1
  %11 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0, !dbg !1477
  %12 = load i32* %11, align 8, !dbg !1477
  %13 = tail call i64 (i64, ...)* @syscall(i64 5, i32 %12, %struct.stat* %buf) nounwind, !dbg !1477
  %14 = trunc i64 %13 to i32, !dbg !1477
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !555), !dbg !1477
  %15 = icmp eq i32 %14, -1, !dbg !1478
  br i1 %15, label %bb3, label %bb6, !dbg !1478

bb3:                                              ; preds = %bb2
  %16 = tail call i32* @__errno_location() nounwind readnone, !dbg !1479
  %17 = tail call i32 @klee_get_errno() nounwind, !dbg !1479
  store i32 %17, i32* %16, align 4, !dbg !1479
  br label %bb6, !dbg !1479

bb5:                                              ; preds = %bb1
  %18 = getelementptr inbounds %struct.exe_disk_file_t* %9, i64 0, i32 2, !dbg !1480
  %19 = load %struct.stat** %18, align 8, !dbg !1480
  %20 = bitcast %struct.stat* %buf to i8*, !dbg !1480
  %21 = bitcast %struct.stat* %19 to i8*, !dbg !1480
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %20, i8* %21, i64 144, i32 8, i1 false), !dbg !1480
  br label %bb6, !dbg !1481

bb6:                                              ; preds = %bb2, %bb3, %bb5, %bb
  %.0 = phi i32 [ -1, %bb ], [ 0, %bb5 ], [ -1, %bb3 ], [ %14, %bb2 ]
  ret i32 %.0, !dbg !1475
}

define i32 @__fd_lstat(i8* %path, %struct.stat* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !557), !dbg !1482
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !558), !dbg !1482
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !267), !dbg !1483
  %0 = load i8* %path, align 1, !dbg !1485
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !268), !dbg !1485
  %1 = icmp eq i8 %0, 0, !dbg !1486
  br i1 %1, label %bb1, label %bb.i, !dbg !1486

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !1486
  %3 = load i8* %2, align 1, !dbg !1486
  %4 = icmp eq i8 %3, 0, !dbg !1486
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !1486

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1487
  %6 = sext i8 %0 to i32, !dbg !1488
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !1488
  %8 = add nsw i32 %7, 65, !dbg !1488
  %9 = icmp eq i32 %6, %8, !dbg !1488
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !1488

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1489
  %11 = zext i32 %18 to i64, !dbg !1489
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !271), !dbg !1489
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !1490
  %13 = load %struct.stat** %12, align 8, !dbg !1490
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !1490
  %15 = load i64* %14, align 8, !dbg !1490
  %16 = icmp eq i64 %15, 0, !dbg !1490
  br i1 %16, label %bb1, label %__get_sym_file.exit, !dbg !1490

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !1487
  br label %bb8.i, !dbg !1487

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !1487
  br i1 %19, label %bb3.i, label %bb1, !dbg !1487

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !1489
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %20}, i64 0, metadata !559), !dbg !1484
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !1491
  br i1 %21, label %bb1, label %bb, !dbg !1491

bb:                                               ; preds = %__get_sym_file.exit
  %22 = bitcast %struct.stat* %buf to i8*, !dbg !1492
  %23 = bitcast %struct.stat* %13 to i8*, !dbg !1492
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %22, i8* %23, i64 144, i32 8, i1 false), !dbg !1492
  br label %bb4, !dbg !1493

bb1:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !354) nounwind, !dbg !1494
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !344) nounwind, !dbg !1496
  %24 = ptrtoint i8* %path to i64, !dbg !1498
  %25 = tail call i64 @klee_get_valuel(i64 %24) nounwind, !dbg !1498
  %26 = inttoptr i64 %25 to i8*, !dbg !1498
  tail call void @llvm.dbg.value(metadata !{i8* %26}, i64 0, metadata !345) nounwind, !dbg !1498
  %27 = icmp eq i8* %26, %path, !dbg !1499
  %28 = zext i1 %27 to i64, !dbg !1499
  tail call void @klee_assume(i64 %28) nounwind, !dbg !1499
  tail call void @llvm.dbg.value(metadata !{i8* %26}, i64 0, metadata !355) nounwind, !dbg !1497
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !357) nounwind, !dbg !1500
  br label %bb.i6, !dbg !1500

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.0.i = phi i8* [ %26, %bb1 ], [ %sc.1.i, %bb6.i8 ]
  %29 = phi i32 [ 0, %bb1 ], [ %41, %bb6.i8 ]
  %tmp.i = add i32 %29, -1
  %30 = load i8* %sc.0.i, align 1, !dbg !1501
  %31 = and i32 %tmp.i, %29, !dbg !1502
  %32 = icmp eq i32 %31, 0, !dbg !1502
  br i1 %32, label %bb1.i, label %bb5.i, !dbg !1502

bb1.i:                                            ; preds = %bb.i6
  switch i8 %30, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %30}, i64 0, metadata !358) nounwind, !dbg !1501
  store i8 0, i8* %sc.0.i, align 1, !dbg !1503
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !355) nounwind, !dbg !1503
  br label %__concretize_string.exit, !dbg !1503

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !1504
  %33 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1504
  br label %bb6.i8, !dbg !1504

bb5.i:                                            ; preds = %bb.i6
  %34 = sext i8 %30 to i64, !dbg !1505
  %35 = tail call i64 @klee_get_valuel(i64 %34) nounwind, !dbg !1505
  %36 = trunc i64 %35 to i8, !dbg !1505
  %37 = icmp eq i8 %36, %30, !dbg !1506
  %38 = zext i1 %37 to i64, !dbg !1506
  tail call void @klee_assume(i64 %38) nounwind, !dbg !1506
  store i8 %36, i8* %sc.0.i, align 1, !dbg !1507
  %39 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1507
  %40 = icmp eq i8 %36, 0, !dbg !1508
  br i1 %40, label %__concretize_string.exit, label %bb6.i8, !dbg !1508

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.1.i = phi i8* [ %33, %bb4.i7 ], [ %39, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %41 = add i32 %29, 1, !dbg !1500
  br label %bb.i6, !dbg !1500

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %42 = tail call i64 (i64, ...)* @syscall(i64 6, i8* %path, %struct.stat* %buf) nounwind, !dbg !1495
  %43 = trunc i64 %42 to i32, !dbg !1495
  tail call void @llvm.dbg.value(metadata !{i32 %43}, i64 0, metadata !561), !dbg !1495
  %44 = icmp eq i32 %43, -1, !dbg !1509
  br i1 %44, label %bb2, label %bb4, !dbg !1509

bb2:                                              ; preds = %__concretize_string.exit
  %45 = tail call i32* @__errno_location() nounwind readnone, !dbg !1510
  %46 = tail call i32 @klee_get_errno() nounwind, !dbg !1510
  store i32 %46, i32* %45, align 4, !dbg !1510
  br label %bb4, !dbg !1510

bb4:                                              ; preds = %__concretize_string.exit, %bb2, %bb
  %.0 = phi i32 [ 0, %bb ], [ -1, %bb2 ], [ %43, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1493
}

define i32 @fstatat(i32 %fd, i8* %path, %struct.stat* %buf, i32 %flags) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !563), !dbg !1511
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !564), !dbg !1511
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !565), !dbg !1511
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !566), !dbg !1511
  %0 = icmp eq i32 %fd, -100, !dbg !1512
  br i1 %0, label %bb5, label %bb, !dbg !1512

bb:                                               ; preds = %entry
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !273), !dbg !1513
  %1 = icmp ult i32 %fd, 32, !dbg !1515
  br i1 %1, label %bb.i, label %bb1, !dbg !1515

bb.i:                                             ; preds = %bb
  %2 = sext i32 %fd to i64, !dbg !1516
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !1516
  %3 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %2, i32 1, !dbg !1517
  %4 = load i32* %3, align 4, !dbg !1517
  %5 = and i32 %4, 1
  %toBool.i = icmp eq i32 %5, 0, !dbg !1517
  br i1 %toBool.i, label %bb1, label %__get_file.exit, !dbg !1517

__get_file.exit:                                  ; preds = %bb.i
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %2, !dbg !1516
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %6}, i64 0, metadata !570), !dbg !1514
  %7 = icmp eq %struct.exe_file_t* %6, null, !dbg !1518
  br i1 %7, label %bb1, label %bb2, !dbg !1518

bb1:                                              ; preds = %bb, %bb.i, %__get_file.exit
  %8 = tail call i32* @__errno_location() nounwind readnone, !dbg !1519
  store i32 9, i32* %8, align 4, !dbg !1519
  br label %bb13, !dbg !1520

bb2:                                              ; preds = %__get_file.exit
  %9 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %2, i32 3, !dbg !1521
  %10 = load %struct.exe_disk_file_t** %9, align 8, !dbg !1521
  %11 = icmp eq %struct.exe_disk_file_t* %10, null, !dbg !1521
  br i1 %11, label %bb4, label %bb3, !dbg !1521

bb3:                                              ; preds = %bb2
  tail call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str6, i64 0, i64 0)) nounwind, !dbg !1522
  %12 = tail call i32* @__errno_location() nounwind readnone, !dbg !1523
  store i32 2, i32* %12, align 4, !dbg !1523
  br label %bb13, !dbg !1524

bb4:                                              ; preds = %bb2
  %13 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %2, i32 0, !dbg !1525
  %14 = load i32* %13, align 8, !dbg !1525
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !563), !dbg !1525
  %phitmp = sext i32 %14 to i64
  br label %bb5, !dbg !1525

bb5:                                              ; preds = %entry, %bb4
  %fd_addr.0 = phi i64 [ %phitmp, %bb4 ], [ -100, %entry ]
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !267), !dbg !1526
  %15 = load i8* %path, align 1, !dbg !1528
  tail call void @llvm.dbg.value(metadata !{i8 %15}, i64 0, metadata !268), !dbg !1528
  %16 = icmp eq i8 %15, 0, !dbg !1529
  br i1 %16, label %bb7, label %bb.i17, !dbg !1529

bb.i17:                                           ; preds = %bb5
  %17 = getelementptr inbounds i8* %path, i64 1, !dbg !1529
  %18 = load i8* %17, align 1, !dbg !1529
  %19 = icmp eq i8 %18, 0, !dbg !1529
  br i1 %19, label %bb8.preheader.i, label %bb7, !dbg !1529

bb8.preheader.i:                                  ; preds = %bb.i17
  %20 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1530
  %21 = sext i8 %15 to i32, !dbg !1531
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %33, 24
  %22 = ashr exact i32 %sext.i, 24, !dbg !1531
  %23 = add nsw i32 %22, 65, !dbg !1531
  %24 = icmp eq i32 %21, %23, !dbg !1531
  br i1 %24, label %bb4.i18, label %bb7.i, !dbg !1531

bb4.i18:                                          ; preds = %bb3.i
  %25 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1532
  %26 = zext i32 %33 to i64, !dbg !1532
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !271), !dbg !1532
  %27 = getelementptr inbounds %struct.exe_disk_file_t* %25, i64 %26, i32 2, !dbg !1533
  %28 = load %struct.stat** %27, align 8, !dbg !1533
  %29 = getelementptr inbounds %struct.stat* %28, i64 0, i32 1, !dbg !1533
  %30 = load i64* %29, align 8, !dbg !1533
  %31 = icmp eq i64 %30, 0, !dbg !1533
  br i1 %31, label %bb7, label %__get_sym_file.exit, !dbg !1533

bb7.i:                                            ; preds = %bb3.i
  %32 = add i32 %33, 1, !dbg !1530
  br label %bb8.i, !dbg !1530

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %33 = phi i32 [ %32, %bb7.i ], [ 0, %bb8.preheader.i ]
  %34 = icmp ugt i32 %20, %33, !dbg !1530
  br i1 %34, label %bb3.i, label %bb7, !dbg !1530

__get_sym_file.exit:                              ; preds = %bb4.i18
  %35 = getelementptr inbounds %struct.exe_disk_file_t* %25, i64 %26, !dbg !1532
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %35}, i64 0, metadata !567), !dbg !1527
  %36 = icmp eq %struct.exe_disk_file_t* %35, null, !dbg !1534
  br i1 %36, label %bb7, label %bb6, !dbg !1534

bb6:                                              ; preds = %__get_sym_file.exit
  %37 = bitcast %struct.stat* %buf to i8*, !dbg !1535
  %38 = bitcast %struct.stat* %28 to i8*, !dbg !1535
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %37, i8* %38, i64 144, i32 8, i1 false), !dbg !1535
  br label %bb13, !dbg !1536

bb7:                                              ; preds = %bb8.i, %bb4.i18, %bb5, %bb.i17, %__get_sym_file.exit
  %39 = sext i32 %flags to i64, !dbg !1537
  %40 = icmp eq i8* %path, null, !dbg !1537
  br i1 %40, label %bb10, label %bb8, !dbg !1537

bb8:                                              ; preds = %bb7
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !354) nounwind, !dbg !1538
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !344) nounwind, !dbg !1539
  %41 = ptrtoint i8* %path to i64, !dbg !1541
  %42 = tail call i64 @klee_get_valuel(i64 %41) nounwind, !dbg !1541
  %43 = inttoptr i64 %42 to i8*, !dbg !1541
  tail call void @llvm.dbg.value(metadata !{i8* %43}, i64 0, metadata !345) nounwind, !dbg !1541
  %44 = icmp eq i8* %43, %path, !dbg !1542
  %45 = zext i1 %44 to i64, !dbg !1542
  tail call void @klee_assume(i64 %45) nounwind, !dbg !1542
  tail call void @llvm.dbg.value(metadata !{i8* %43}, i64 0, metadata !355) nounwind, !dbg !1540
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !357) nounwind, !dbg !1543
  br label %bb.i15, !dbg !1543

bb.i15:                                           ; preds = %bb6.i, %bb8
  %sc.0.i = phi i8* [ %43, %bb8 ], [ %sc.1.i, %bb6.i ]
  %46 = phi i32 [ 0, %bb8 ], [ %58, %bb6.i ]
  %tmp.i = add i32 %46, -1
  %47 = load i8* %sc.0.i, align 1, !dbg !1544
  %48 = and i32 %tmp.i, %46, !dbg !1545
  %49 = icmp eq i32 %48, 0, !dbg !1545
  br i1 %49, label %bb1.i16, label %bb5.i, !dbg !1545

bb1.i16:                                          ; preds = %bb.i15
  switch i8 %47, label %bb6.i [
    i8 0, label %bb2.i
    i8 47, label %bb4.i
  ]

bb2.i:                                            ; preds = %bb1.i16
  tail call void @llvm.dbg.value(metadata !{i8 %47}, i64 0, metadata !358) nounwind, !dbg !1544
  store i8 0, i8* %sc.0.i, align 1, !dbg !1546
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !355) nounwind, !dbg !1546
  br label %bb10, !dbg !1546

bb4.i:                                            ; preds = %bb1.i16
  store i8 47, i8* %sc.0.i, align 1, !dbg !1547
  %50 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1547
  br label %bb6.i, !dbg !1547

bb5.i:                                            ; preds = %bb.i15
  %51 = sext i8 %47 to i64, !dbg !1548
  %52 = tail call i64 @klee_get_valuel(i64 %51) nounwind, !dbg !1548
  %53 = trunc i64 %52 to i8, !dbg !1548
  %54 = icmp eq i8 %53, %47, !dbg !1549
  %55 = zext i1 %54 to i64, !dbg !1549
  tail call void @klee_assume(i64 %55) nounwind, !dbg !1549
  store i8 %53, i8* %sc.0.i, align 1, !dbg !1550
  %56 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1550
  %57 = icmp eq i8 %53, 0, !dbg !1551
  br i1 %57, label %bb10, label %bb6.i, !dbg !1551

bb6.i:                                            ; preds = %bb5.i, %bb4.i, %bb1.i16
  %sc.1.i = phi i8* [ %50, %bb4.i ], [ %56, %bb5.i ], [ %sc.0.i, %bb1.i16 ]
  %58 = add i32 %46, 1, !dbg !1543
  br label %bb.i15, !dbg !1543

bb10:                                             ; preds = %bb5.i, %bb2.i, %bb7
  %iftmp.37.0 = phi i8* [ null, %bb7 ], [ %path, %bb2.i ], [ %path, %bb5.i ]
  %59 = tail call i64 (i64, ...)* @syscall(i64 262, i64 %fd_addr.0, i8* %iftmp.37.0, %struct.stat* %buf, i64 %39) nounwind, !dbg !1537
  %60 = trunc i64 %59 to i32, !dbg !1537
  tail call void @llvm.dbg.value(metadata !{i32 %60}, i64 0, metadata !569), !dbg !1537
  %61 = icmp eq i32 %60, -1, !dbg !1552
  br i1 %61, label %bb11, label %bb13, !dbg !1552

bb11:                                             ; preds = %bb10
  %62 = tail call i32* @__errno_location() nounwind readnone, !dbg !1553
  %63 = tail call i32 @klee_get_errno() nounwind, !dbg !1553
  store i32 %63, i32* %62, align 4, !dbg !1553
  br label %bb13, !dbg !1553

bb13:                                             ; preds = %bb10, %bb11, %bb6, %bb3, %bb1
  %.0 = phi i32 [ -1, %bb1 ], [ -1, %bb3 ], [ 0, %bb6 ], [ -1, %bb11 ], [ %60, %bb10 ]
  ret i32 %.0, !dbg !1520
}

define i32 @__fd_stat(i8* %path, %struct.stat* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !572), !dbg !1554
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !573), !dbg !1554
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !267), !dbg !1555
  %0 = load i8* %path, align 1, !dbg !1557
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !268), !dbg !1557
  %1 = icmp eq i8 %0, 0, !dbg !1558
  br i1 %1, label %bb1, label %bb.i, !dbg !1558

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !1558
  %3 = load i8* %2, align 1, !dbg !1558
  %4 = icmp eq i8 %3, 0, !dbg !1558
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !1558

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1559
  %6 = sext i8 %0 to i32, !dbg !1560
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !1560
  %8 = add nsw i32 %7, 65, !dbg !1560
  %9 = icmp eq i32 %6, %8, !dbg !1560
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !1560

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1561
  %11 = zext i32 %18 to i64, !dbg !1561
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !271), !dbg !1561
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !1562
  %13 = load %struct.stat** %12, align 8, !dbg !1562
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !1562
  %15 = load i64* %14, align 8, !dbg !1562
  %16 = icmp eq i64 %15, 0, !dbg !1562
  br i1 %16, label %bb1, label %__get_sym_file.exit, !dbg !1562

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !1559
  br label %bb8.i, !dbg !1559

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !1559
  br i1 %19, label %bb3.i, label %bb1, !dbg !1559

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !1561
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %20}, i64 0, metadata !574), !dbg !1556
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !1563
  br i1 %21, label %bb1, label %bb, !dbg !1563

bb:                                               ; preds = %__get_sym_file.exit
  %22 = bitcast %struct.stat* %buf to i8*, !dbg !1564
  %23 = bitcast %struct.stat* %13 to i8*, !dbg !1564
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %22, i8* %23, i64 144, i32 8, i1 false), !dbg !1564
  br label %bb4, !dbg !1565

bb1:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !354) nounwind, !dbg !1566
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !344) nounwind, !dbg !1568
  %24 = ptrtoint i8* %path to i64, !dbg !1570
  %25 = tail call i64 @klee_get_valuel(i64 %24) nounwind, !dbg !1570
  %26 = inttoptr i64 %25 to i8*, !dbg !1570
  tail call void @llvm.dbg.value(metadata !{i8* %26}, i64 0, metadata !345) nounwind, !dbg !1570
  %27 = icmp eq i8* %26, %path, !dbg !1571
  %28 = zext i1 %27 to i64, !dbg !1571
  tail call void @klee_assume(i64 %28) nounwind, !dbg !1571
  tail call void @llvm.dbg.value(metadata !{i8* %26}, i64 0, metadata !355) nounwind, !dbg !1569
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !357) nounwind, !dbg !1572
  br label %bb.i6, !dbg !1572

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.0.i = phi i8* [ %26, %bb1 ], [ %sc.1.i, %bb6.i8 ]
  %29 = phi i32 [ 0, %bb1 ], [ %41, %bb6.i8 ]
  %tmp.i = add i32 %29, -1
  %30 = load i8* %sc.0.i, align 1, !dbg !1573
  %31 = and i32 %tmp.i, %29, !dbg !1574
  %32 = icmp eq i32 %31, 0, !dbg !1574
  br i1 %32, label %bb1.i, label %bb5.i, !dbg !1574

bb1.i:                                            ; preds = %bb.i6
  switch i8 %30, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %30}, i64 0, metadata !358) nounwind, !dbg !1573
  store i8 0, i8* %sc.0.i, align 1, !dbg !1575
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !355) nounwind, !dbg !1575
  br label %__concretize_string.exit, !dbg !1575

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !1576
  %33 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1576
  br label %bb6.i8, !dbg !1576

bb5.i:                                            ; preds = %bb.i6
  %34 = sext i8 %30 to i64, !dbg !1577
  %35 = tail call i64 @klee_get_valuel(i64 %34) nounwind, !dbg !1577
  %36 = trunc i64 %35 to i8, !dbg !1577
  %37 = icmp eq i8 %36, %30, !dbg !1578
  %38 = zext i1 %37 to i64, !dbg !1578
  tail call void @klee_assume(i64 %38) nounwind, !dbg !1578
  store i8 %36, i8* %sc.0.i, align 1, !dbg !1579
  %39 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1579
  %40 = icmp eq i8 %36, 0, !dbg !1580
  br i1 %40, label %__concretize_string.exit, label %bb6.i8, !dbg !1580

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.1.i = phi i8* [ %33, %bb4.i7 ], [ %39, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %41 = add i32 %29, 1, !dbg !1572
  br label %bb.i6, !dbg !1572

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %42 = tail call i64 (i64, ...)* @syscall(i64 4, i8* %path, %struct.stat* %buf) nounwind, !dbg !1567
  %43 = trunc i64 %42 to i32, !dbg !1567
  tail call void @llvm.dbg.value(metadata !{i32 %43}, i64 0, metadata !576), !dbg !1567
  %44 = icmp eq i32 %43, -1, !dbg !1581
  br i1 %44, label %bb2, label %bb4, !dbg !1581

bb2:                                              ; preds = %__concretize_string.exit
  %45 = tail call i32* @__errno_location() nounwind readnone, !dbg !1582
  %46 = tail call i32 @klee_get_errno() nounwind, !dbg !1582
  store i32 %46, i32* %45, align 4, !dbg !1582
  br label %bb4, !dbg !1582

bb4:                                              ; preds = %__concretize_string.exit, %bb2, %bb
  %.0 = phi i32 [ 0, %bb ], [ -1, %bb2 ], [ %43, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1565
}

define i64 @write(i32 %fd, i8* %buf, i64 %count) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !578), !dbg !1583
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !579), !dbg !1583
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !580), !dbg !1583
  %0 = load i32* @n_calls.4950, align 4, !dbg !1584
  %1 = add nsw i32 %0, 1, !dbg !1584
  store i32 %1, i32* @n_calls.4950, align 4, !dbg !1584
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !273), !dbg !1585
  %2 = icmp ult i32 %fd, 32, !dbg !1587
  br i1 %2, label %bb.i, label %bb, !dbg !1587

bb.i:                                             ; preds = %entry
  %3 = sext i32 %fd to i64, !dbg !1588
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !1588
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !1589
  %5 = load i32* %4, align 4, !dbg !1589
  %6 = and i32 %5, 1
  %toBool.i = icmp eq i32 %6, 0, !dbg !1589
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1589

__get_file.exit:                                  ; preds = %bb.i
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !1588
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %7}, i64 0, metadata !581), !dbg !1586
  %8 = icmp eq %struct.exe_file_t* %7, null, !dbg !1590
  br i1 %8, label %bb, label %bb1, !dbg !1590

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %9 = tail call i32* @__errno_location() nounwind readnone, !dbg !1591
  store i32 9, i32* %9, align 4, !dbg !1591
  br label %bb28, !dbg !1592

bb1:                                              ; preds = %__get_file.exit
  %10 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1593
  %11 = icmp eq i32 %10, 0, !dbg !1593
  br i1 %11, label %bb4, label %bb2, !dbg !1593

bb2:                                              ; preds = %bb1
  %12 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 7), align 8, !dbg !1593
  %13 = load i32* %12, align 4, !dbg !1593
  %14 = icmp eq i32 %13, %1, !dbg !1593
  br i1 %14, label %bb3, label %bb4, !dbg !1593

bb3:                                              ; preds = %bb2
  %15 = add i32 %10, -1, !dbg !1594
  store i32 %15, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1594
  %16 = tail call i32* @__errno_location() nounwind readnone, !dbg !1595
  store i32 5, i32* %16, align 4, !dbg !1595
  br label %bb28, !dbg !1596

bb4:                                              ; preds = %bb1, %bb2
  %17 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !1597
  %18 = load %struct.exe_disk_file_t** %17, align 8, !dbg !1597
  %19 = icmp eq %struct.exe_disk_file_t* %18, null, !dbg !1597
  br i1 %19, label %bb5, label %bb15, !dbg !1597

bb5:                                              ; preds = %bb4
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !344) nounwind, !dbg !1598
  %20 = ptrtoint i8* %buf to i64, !dbg !1600
  %21 = tail call i64 @klee_get_valuel(i64 %20) nounwind, !dbg !1600
  %22 = inttoptr i64 %21 to i8*, !dbg !1600
  tail call void @llvm.dbg.value(metadata !{i8* %22}, i64 0, metadata !345) nounwind, !dbg !1600
  %23 = icmp eq i8* %22, %buf, !dbg !1601
  %24 = zext i1 %23 to i64, !dbg !1601
  tail call void @klee_assume(i64 %24) nounwind, !dbg !1601
  tail call void @llvm.dbg.value(metadata !{i8* %22}, i64 0, metadata !579), !dbg !1599
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !347) nounwind, !dbg !1602
  %25 = tail call i64 @klee_get_valuel(i64 %count) nounwind, !dbg !1604
  tail call void @llvm.dbg.value(metadata !{i64 %25}, i64 0, metadata !348) nounwind, !dbg !1604
  %26 = icmp eq i64 %25, %count, !dbg !1605
  %27 = zext i1 %26 to i64, !dbg !1605
  tail call void @klee_assume(i64 %27) nounwind, !dbg !1605
  tail call void @llvm.dbg.value(metadata !{i64 %25}, i64 0, metadata !580), !dbg !1603
  tail call void @klee_check_memory_access(i8* %22, i64 %25) nounwind, !dbg !1606
  %28 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 0, !dbg !1607
  %29 = load i32* %28, align 8, !dbg !1607
  %30 = add i32 %29, -1, !dbg !1607
  %31 = icmp ult i32 %30, 2, !dbg !1607
  br i1 %31, label %bb6, label %bb7, !dbg !1607

bb6:                                              ; preds = %bb5
  %32 = tail call i64 (i64, ...)* @syscall(i64 1, i32 %29, i8* %22, i64 %25) nounwind, !dbg !1608
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !583), !dbg !1608
  br label %bb8, !dbg !1608

bb7:                                              ; preds = %bb5
  %33 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 2, !dbg !1609
  %34 = load i64* %33, align 8, !dbg !1609
  %35 = tail call i64 (i64, ...)* @syscall(i64 18, i32 %29, i8* %22, i64 %25, i64 %34) nounwind, !dbg !1609
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !583), !dbg !1609
  br label %bb8, !dbg !1609

bb8:                                              ; preds = %bb7, %bb6
  %r.0.in = phi i64 [ %32, %bb6 ], [ %35, %bb7 ]
  %r.0 = trunc i64 %r.0.in to i32
  %36 = icmp eq i32 %r.0, -1, !dbg !1610
  br i1 %36, label %bb9, label %bb10, !dbg !1610

bb9:                                              ; preds = %bb8
  %37 = tail call i32* @__errno_location() nounwind readnone, !dbg !1611
  %38 = tail call i32 @klee_get_errno() nounwind, !dbg !1611
  store i32 %38, i32* %37, align 4, !dbg !1611
  br label %bb28, !dbg !1612

bb10:                                             ; preds = %bb8
  %39 = icmp slt i32 %r.0, 0, !dbg !1613
  br i1 %39, label %bb11, label %bb12, !dbg !1613

bb11:                                             ; preds = %bb10
  tail call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str18, i64 0, i64 0), i32 440, i8* getelementptr inbounds ([6 x i8]* @__PRETTY_FUNCTION__.4953, i64 0, i64 0)) noreturn nounwind, !dbg !1613
  unreachable, !dbg !1613

bb12:                                             ; preds = %bb10
  %40 = load i32* %28, align 8, !dbg !1614
  %41 = add i32 %40, -1, !dbg !1614
  %42 = icmp ugt i32 %41, 1, !dbg !1614
  br i1 %42, label %bb13, label %bb12.bb14_crit_edge, !dbg !1614

bb12.bb14_crit_edge:                              ; preds = %bb12
  %.pre = sext i32 %r.0 to i64, !dbg !1615
  br label %bb28

bb13:                                             ; preds = %bb12
  %43 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 2, !dbg !1616
  %44 = load i64* %43, align 8, !dbg !1616
  %45 = sext i32 %r.0 to i64, !dbg !1616
  %46 = add nsw i64 %44, %45, !dbg !1616
  store i64 %46, i64* %43, align 8, !dbg !1616
  br label %bb28, !dbg !1616

bb15:                                             ; preds = %bb4
  tail call void @llvm.dbg.value(metadata !1397, i64 0, metadata !585), !dbg !1617
  %47 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 2, !dbg !1618
  %48 = load i64* %47, align 8, !dbg !1618
  %49 = add i64 %48, %count, !dbg !1618
  %50 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 0, i32 0, !dbg !1618
  %51 = load i32* %50, align 8, !dbg !1618
  %52 = zext i32 %51 to i64, !dbg !1618
  %53 = icmp ugt i64 %49, %52, !dbg !1618
  br i1 %53, label %bb17, label %bb21, !dbg !1618

bb17:                                             ; preds = %bb15
  %54 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 3), align 8, !dbg !1619
  %55 = icmp eq i32 %54, 0, !dbg !1619
  br i1 %55, label %bb19, label %bb18, !dbg !1619

bb18:                                             ; preds = %bb17
  tail call void @__assert_fail(i8* getelementptr inbounds ([2 x i8]* @.str21, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str18, i64 0, i64 0), i32 453, i8* getelementptr inbounds ([6 x i8]* @__PRETTY_FUNCTION__.4953, i64 0, i64 0)) noreturn nounwind, !dbg !1620
  unreachable, !dbg !1620

bb19:                                             ; preds = %bb17
  %56 = icmp slt i64 %48, %52, !dbg !1621
  br i1 %56, label %bb20, label %bb23, !dbg !1621

bb20:                                             ; preds = %bb19
  %57 = sub nsw i64 %52, %48, !dbg !1622
  tail call void @llvm.dbg.value(metadata !{i64 %57}, i64 0, metadata !585), !dbg !1622
  br label %bb21, !dbg !1622

bb21:                                             ; preds = %bb15, %bb20
  %actual_count.0 = phi i64 [ %57, %bb20 ], [ %count, %bb15 ]
  %58 = icmp eq i64 %actual_count.0, 0, !dbg !1623
  br i1 %58, label %bb23, label %bb22, !dbg !1623

bb22:                                             ; preds = %bb21
  %59 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 0, i32 1, !dbg !1624
  %60 = load i8** %59, align 8, !dbg !1624
  %61 = getelementptr inbounds i8* %60, i64 %48, !dbg !1624
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %61, i8* %buf, i64 %actual_count.0, i32 1, i1 false), !dbg !1624
  br label %bb23, !dbg !1624

bb23:                                             ; preds = %bb19, %bb21, %bb22
  %actual_count.030 = phi i64 [ 0, %bb21 ], [ %actual_count.0, %bb22 ], [ 0, %bb19 ]
  %62 = icmp eq i64 %actual_count.030, %count, !dbg !1625
  br i1 %62, label %bb25, label %bb24, !dbg !1625

bb24:                                             ; preds = %bb23
  tail call void @klee_warning(i8* getelementptr inbounds ([24 x i8]* @.str22, i64 0, i64 0)) nounwind, !dbg !1626
  br label %bb25, !dbg !1626

bb25:                                             ; preds = %bb23, %bb24
  %63 = load %struct.exe_disk_file_t** %17, align 8, !dbg !1627
  %64 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 2), align 8, !dbg !1627
  %65 = icmp eq %struct.exe_disk_file_t* %63, %64, !dbg !1627
  br i1 %65, label %bb26, label %bb27, !dbg !1627

bb26:                                             ; preds = %bb25
  %66 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 3), align 8, !dbg !1628
  %67 = trunc i64 %actual_count.030 to i32, !dbg !1628
  %68 = add i32 %66, %67, !dbg !1628
  store i32 %68, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 3), align 8, !dbg !1628
  br label %bb27, !dbg !1628

bb27:                                             ; preds = %bb25, %bb26
  %69 = load i64* %47, align 8, !dbg !1629
  %70 = add i64 %69, %count, !dbg !1629
  store i64 %70, i64* %47, align 8, !dbg !1629
  br label %bb28, !dbg !1630

bb28:                                             ; preds = %bb13, %bb12.bb14_crit_edge, %bb27, %bb9, %bb3, %bb
  %.0 = phi i64 [ -1, %bb ], [ -1, %bb3 ], [ -1, %bb9 ], [ %count, %bb27 ], [ %.pre, %bb12.bb14_crit_edge ], [ %45, %bb13 ]
  ret i64 %.0, !dbg !1592
}

define i64 @read(i32 %fd, i8* %buf, i64 %count) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !587), !dbg !1631
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !588), !dbg !1631
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !589), !dbg !1631
  %0 = load i32* @n_calls.4889, align 4, !dbg !1632
  %1 = add nsw i32 %0, 1, !dbg !1632
  store i32 %1, i32* @n_calls.4889, align 4, !dbg !1632
  %2 = icmp eq i64 %count, 0, !dbg !1633
  br i1 %2, label %bb24, label %bb1, !dbg !1633

bb1:                                              ; preds = %entry
  %3 = icmp eq i8* %buf, null, !dbg !1634
  br i1 %3, label %bb2, label %bb3, !dbg !1634

bb2:                                              ; preds = %bb1
  %4 = tail call i32* @__errno_location() nounwind readnone, !dbg !1635
  store i32 14, i32* %4, align 4, !dbg !1635
  br label %bb24, !dbg !1636

bb3:                                              ; preds = %bb1
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !273), !dbg !1637
  %5 = icmp ult i32 %fd, 32, !dbg !1639
  br i1 %5, label %bb.i, label %bb4, !dbg !1639

bb.i:                                             ; preds = %bb3
  %6 = sext i32 %fd to i64, !dbg !1640
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !1640
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %6, i32 1, !dbg !1641
  %8 = load i32* %7, align 4, !dbg !1641
  %9 = and i32 %8, 1
  %toBool.i = icmp eq i32 %9, 0, !dbg !1641
  br i1 %toBool.i, label %bb4, label %__get_file.exit, !dbg !1641

__get_file.exit:                                  ; preds = %bb.i
  %10 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %6, !dbg !1640
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %10}, i64 0, metadata !590), !dbg !1638
  %11 = icmp eq %struct.exe_file_t* %10, null, !dbg !1642
  br i1 %11, label %bb4, label %bb5, !dbg !1642

bb4:                                              ; preds = %bb3, %bb.i, %__get_file.exit
  %12 = tail call i32* @__errno_location() nounwind readnone, !dbg !1643
  store i32 9, i32* %12, align 4, !dbg !1643
  br label %bb24, !dbg !1644

bb5:                                              ; preds = %__get_file.exit
  %13 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1645
  %14 = icmp eq i32 %13, 0, !dbg !1645
  br i1 %14, label %bb8, label %bb6, !dbg !1645

bb6:                                              ; preds = %bb5
  %15 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 6), align 8, !dbg !1645
  %16 = load i32* %15, align 4, !dbg !1645
  %17 = icmp eq i32 %16, %1, !dbg !1645
  br i1 %17, label %bb7, label %bb8, !dbg !1645

bb7:                                              ; preds = %bb6
  %18 = add i32 %13, -1, !dbg !1646
  store i32 %18, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1646
  %19 = tail call i32* @__errno_location() nounwind readnone, !dbg !1647
  store i32 5, i32* %19, align 4, !dbg !1647
  br label %bb24, !dbg !1648

bb8:                                              ; preds = %bb5, %bb6
  %20 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %6, i32 3, !dbg !1649
  %21 = load %struct.exe_disk_file_t** %20, align 8, !dbg !1649
  %22 = icmp eq %struct.exe_disk_file_t* %21, null, !dbg !1649
  br i1 %22, label %bb9, label %bb17, !dbg !1649

bb9:                                              ; preds = %bb8
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !344) nounwind, !dbg !1650
  %23 = ptrtoint i8* %buf to i64, !dbg !1652
  %24 = tail call i64 @klee_get_valuel(i64 %23) nounwind, !dbg !1652
  %25 = inttoptr i64 %24 to i8*, !dbg !1652
  tail call void @llvm.dbg.value(metadata !{i8* %25}, i64 0, metadata !345) nounwind, !dbg !1652
  %26 = icmp eq i8* %25, %buf, !dbg !1653
  %27 = zext i1 %26 to i64, !dbg !1653
  tail call void @klee_assume(i64 %27) nounwind, !dbg !1653
  tail call void @llvm.dbg.value(metadata !{i8* %25}, i64 0, metadata !588), !dbg !1651
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !347) nounwind, !dbg !1654
  %28 = tail call i64 @klee_get_valuel(i64 %count) nounwind, !dbg !1656
  tail call void @llvm.dbg.value(metadata !{i64 %28}, i64 0, metadata !348) nounwind, !dbg !1656
  %29 = icmp eq i64 %28, %count, !dbg !1657
  %30 = zext i1 %29 to i64, !dbg !1657
  tail call void @klee_assume(i64 %30) nounwind, !dbg !1657
  tail call void @llvm.dbg.value(metadata !{i64 %28}, i64 0, metadata !589), !dbg !1655
  tail call void @klee_check_memory_access(i8* %25, i64 %28) nounwind, !dbg !1658
  %31 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %6, i32 0, !dbg !1659
  %32 = load i32* %31, align 8, !dbg !1659
  %33 = icmp eq i32 %32, 0, !dbg !1659
  br i1 %33, label %bb10, label %bb11, !dbg !1659

bb10:                                             ; preds = %bb9
  %34 = tail call i64 (i64, ...)* @syscall(i64 0, i32 %32, i8* %25, i64 %28) nounwind, !dbg !1660
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !592), !dbg !1660
  br label %bb12, !dbg !1660

bb11:                                             ; preds = %bb9
  %35 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %6, i32 2, !dbg !1661
  %36 = load i64* %35, align 8, !dbg !1661
  %37 = tail call i64 (i64, ...)* @syscall(i64 17, i32 %32, i8* %25, i64 %28, i64 %36) nounwind, !dbg !1661
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !592), !dbg !1661
  br label %bb12, !dbg !1661

bb12:                                             ; preds = %bb11, %bb10
  %r.0.in = phi i64 [ %34, %bb10 ], [ %37, %bb11 ]
  %r.0 = trunc i64 %r.0.in to i32
  %38 = icmp eq i32 %r.0, -1, !dbg !1662
  br i1 %38, label %bb13, label %bb14, !dbg !1662

bb13:                                             ; preds = %bb12
  %39 = tail call i32* @__errno_location() nounwind readnone, !dbg !1663
  %40 = tail call i32 @klee_get_errno() nounwind, !dbg !1663
  store i32 %40, i32* %39, align 4, !dbg !1663
  br label %bb24, !dbg !1664

bb14:                                             ; preds = %bb12
  %41 = load i32* %31, align 8, !dbg !1665
  %42 = icmp eq i32 %41, 0, !dbg !1665
  br i1 %42, label %bb14.bb16_crit_edge, label %bb15, !dbg !1665

bb14.bb16_crit_edge:                              ; preds = %bb14
  %.pre = sext i32 %r.0 to i64, !dbg !1666
  br label %bb24

bb15:                                             ; preds = %bb14
  %43 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %6, i32 2, !dbg !1667
  %44 = load i64* %43, align 8, !dbg !1667
  %45 = sext i32 %r.0 to i64, !dbg !1667
  %46 = add nsw i64 %44, %45, !dbg !1667
  store i64 %46, i64* %43, align 8, !dbg !1667
  br label %bb24, !dbg !1667

bb17:                                             ; preds = %bb8
  %47 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %6, i32 2, !dbg !1668
  %48 = load i64* %47, align 8, !dbg !1668
  %49 = icmp slt i64 %48, 0, !dbg !1668
  br i1 %49, label %bb18, label %bb19, !dbg !1668

bb18:                                             ; preds = %bb17
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str23, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str18, i64 0, i64 0), i32 386, i8* getelementptr inbounds ([5 x i8]* @__PRETTY_FUNCTION__.4892, i64 0, i64 0)) noreturn nounwind, !dbg !1668
  unreachable, !dbg !1668

bb19:                                             ; preds = %bb17
  %50 = getelementptr inbounds %struct.exe_disk_file_t* %21, i64 0, i32 0, !dbg !1669
  %51 = load i32* %50, align 8, !dbg !1669
  %52 = zext i32 %51 to i64, !dbg !1669
  %53 = icmp slt i64 %52, %48, !dbg !1669
  br i1 %53, label %bb24, label %bb21, !dbg !1669

bb21:                                             ; preds = %bb19
  %54 = add i64 %48, %count, !dbg !1670
  %55 = sub nsw i64 %52, %48, !dbg !1671
  %56 = icmp ugt i64 %54, %52, !dbg !1670
  %.count = select i1 %56, i64 %55, i64 %count
  %57 = getelementptr inbounds %struct.exe_disk_file_t* %21, i64 0, i32 1, !dbg !1672
  %58 = load i8** %57, align 8, !dbg !1672
  %59 = getelementptr inbounds i8* %58, i64 %48, !dbg !1672
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %buf, i8* %59, i64 %.count, i32 1, i1 false), !dbg !1672
  %60 = load i64* %47, align 8, !dbg !1673
  %61 = add i64 %60, %.count, !dbg !1673
  store i64 %61, i64* %47, align 8, !dbg !1673
  br label %bb24, !dbg !1674

bb24:                                             ; preds = %bb15, %bb14.bb16_crit_edge, %bb19, %entry, %bb21, %bb13, %bb7, %bb4, %bb2
  %.0 = phi i64 [ -1, %bb2 ], [ -1, %bb4 ], [ -1, %bb7 ], [ -1, %bb13 ], [ %.count, %bb21 ], [ 0, %entry ], [ 0, %bb19 ], [ %.pre, %bb14.bb16_crit_edge ], [ %45, %bb15 ]
  ret i64 %.0, !dbg !1675
}

declare i32 @geteuid() nounwind

declare i32 @getgid() nounwind

define i32 @fchmod(i32 %fd, i32 %mode) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !596), !dbg !1676
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !597), !dbg !1676
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !273), !dbg !1677
  %0 = icmp ult i32 %fd, 32, !dbg !1679
  br i1 %0, label %bb.i, label %bb, !dbg !1679

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !1680
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !274), !dbg !1680
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1, !dbg !1681
  %3 = load i32* %2, align 4, !dbg !1681
  %4 = and i32 %3, 1
  %toBool.i = icmp eq i32 %4, 0, !dbg !1681
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1681

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, !dbg !1680
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !598), !dbg !1678
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !1682
  br i1 %6, label %bb, label %bb1, !dbg !1682

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !1683
  store i32 9, i32* %7, align 4, !dbg !1683
  br label %bb9, !dbg !1684

bb1:                                              ; preds = %__get_file.exit
  %8 = load i32* @n_calls.5168, align 4, !dbg !1685
  %9 = add nsw i32 %8, 1, !dbg !1685
  store i32 %9, i32* @n_calls.5168, align 4, !dbg !1685
  %10 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1686
  %11 = icmp eq i32 %10, 0, !dbg !1686
  br i1 %11, label %bb4, label %bb2, !dbg !1686

bb2:                                              ; preds = %bb1
  %12 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 12), align 8, !dbg !1686
  %13 = load i32* %12, align 4, !dbg !1686
  %14 = icmp eq i32 %13, %9, !dbg !1686
  br i1 %14, label %bb3, label %bb4, !dbg !1686

bb3:                                              ; preds = %bb2
  %15 = add i32 %10, -1, !dbg !1687
  store i32 %15, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1687
  %16 = tail call i32* @__errno_location() nounwind readnone, !dbg !1688
  store i32 5, i32* %16, align 4, !dbg !1688
  br label %bb9, !dbg !1689

bb4:                                              ; preds = %bb1, %bb2
  %17 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3, !dbg !1690
  %18 = load %struct.exe_disk_file_t** %17, align 8, !dbg !1690
  %19 = icmp eq %struct.exe_disk_file_t* %18, null, !dbg !1690
  br i1 %19, label %bb6, label %bb5, !dbg !1690

bb5:                                              ; preds = %bb4
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %18}, i64 0, metadata !594) nounwind, !dbg !1691
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !595) nounwind, !dbg !1691
  %20 = tail call i32 @geteuid() nounwind, !dbg !1693
  %21 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 0, i32 2, !dbg !1693
  %22 = load %struct.stat** %21, align 8, !dbg !1693
  %23 = getelementptr inbounds %struct.stat* %22, i64 0, i32 4, !dbg !1693
  %24 = load i32* %23, align 4, !dbg !1693
  %25 = icmp eq i32 %20, %24, !dbg !1693
  br i1 %25, label %bb.i11, label %bb3.i, !dbg !1693

bb.i11:                                           ; preds = %bb5
  %26 = tail call i32 @getgid() nounwind, !dbg !1695
  %27 = load %struct.stat** %21, align 8, !dbg !1695
  %28 = getelementptr inbounds %struct.stat* %27, i64 0, i32 5, !dbg !1695
  %29 = load i32* %28, align 8, !dbg !1695
  %30 = and i32 %mode, 3071, !dbg !1696
  %31 = icmp eq i32 %26, %29, !dbg !1695
  %mode..i = select i1 %31, i32 %mode, i32 %30
  %32 = getelementptr inbounds %struct.stat* %27, i64 0, i32 3, !dbg !1697
  %33 = load i32* %32, align 8, !dbg !1697
  %34 = and i32 %33, -4096, !dbg !1697
  %35 = and i32 %mode..i, 4095, !dbg !1697
  %36 = or i32 %35, %34, !dbg !1697
  store i32 %36, i32* %32, align 8, !dbg !1697
  br label %bb9, !dbg !1698

bb3.i:                                            ; preds = %bb5
  %37 = tail call i32* @__errno_location() nounwind readnone, !dbg !1699
  store i32 1, i32* %37, align 4, !dbg !1699
  br label %bb9, !dbg !1700

bb6:                                              ; preds = %bb4
  %38 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0, !dbg !1701
  %39 = load i32* %38, align 8, !dbg !1701
  %40 = tail call i64 (i64, ...)* @syscall(i64 91, i32 %39, i32 %mode) nounwind, !dbg !1701
  %41 = trunc i64 %40 to i32, !dbg !1701
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !600), !dbg !1701
  %42 = icmp eq i32 %41, -1, !dbg !1702
  br i1 %42, label %bb7, label %bb9, !dbg !1702

bb7:                                              ; preds = %bb6
  %43 = tail call i32* @__errno_location() nounwind readnone, !dbg !1703
  %44 = tail call i32 @klee_get_errno() nounwind, !dbg !1703
  store i32 %44, i32* %43, align 4, !dbg !1703
  br label %bb9, !dbg !1703

bb9:                                              ; preds = %bb3.i, %bb.i11, %bb6, %bb7, %bb3, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb3 ], [ -1, %bb7 ], [ %41, %bb6 ], [ 0, %bb.i11 ], [ -1, %bb3.i ]
  ret i32 %.0, !dbg !1684
}

define i32 @chmod(i8* %path, i32 %mode) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !602), !dbg !1704
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !603), !dbg !1704
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !267), !dbg !1705
  %0 = load i8* %path, align 1, !dbg !1707
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !268), !dbg !1707
  %1 = icmp eq i8 %0, 0, !dbg !1708
  br i1 %1, label %__get_sym_file.exit, label %bb.i, !dbg !1708

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !1708
  %3 = load i8* %2, align 1, !dbg !1708
  %4 = icmp eq i8 %3, 0, !dbg !1708
  br i1 %4, label %bb8.preheader.i, label %__get_sym_file.exit, !dbg !1708

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1709
  %6 = sext i8 %0 to i32, !dbg !1710
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %19, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !1710
  %8 = add nsw i32 %7, 65, !dbg !1710
  %9 = icmp eq i32 %6, %8, !dbg !1710
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !1710

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1711
  %11 = zext i32 %19 to i64, !dbg !1711
  tail call void @llvm.dbg.value(metadata !616, i64 0, metadata !271), !dbg !1711
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !1712
  %13 = load %struct.stat** %12, align 8, !dbg !1712
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !1712
  %15 = load i64* %14, align 8, !dbg !1712
  %16 = icmp eq i64 %15, 0, !dbg !1712
  br i1 %16, label %__get_sym_file.exit, label %bb6.i, !dbg !1712

bb6.i:                                            ; preds = %bb4.i
  %17 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !1711
  br label %__get_sym_file.exit, !dbg !1713

bb7.i:                                            ; preds = %bb3.i
  %18 = add i32 %19, 1, !dbg !1709
  br label %bb8.i, !dbg !1709

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %19 = phi i32 [ %18, %bb7.i ], [ 0, %bb8.preheader.i ]
  %20 = icmp ugt i32 %5, %19, !dbg !1709
  br i1 %20, label %bb3.i, label %__get_sym_file.exit, !dbg !1709

__get_sym_file.exit:                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %bb6.i
  %.0.i = phi %struct.exe_disk_file_t* [ %17, %bb6.i ], [ null, %bb.i ], [ null, %entry ], [ null, %bb4.i ], [ null, %bb8.i ]
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %.0.i}, i64 0, metadata !604), !dbg !1706
  %21 = load i32* @n_calls.5145, align 4, !dbg !1714
  %22 = add nsw i32 %21, 1, !dbg !1714
  store i32 %22, i32* @n_calls.5145, align 4, !dbg !1714
  %23 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1715
  %24 = icmp eq i32 %23, 0, !dbg !1715
  br i1 %24, label %bb2, label %bb, !dbg !1715

bb:                                               ; preds = %__get_sym_file.exit
  %25 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 11), align 8, !dbg !1715
  %26 = load i32* %25, align 4, !dbg !1715
  %27 = icmp eq i32 %26, %22, !dbg !1715
  br i1 %27, label %bb1, label %bb2, !dbg !1715

bb1:                                              ; preds = %bb
  %28 = add i32 %23, -1, !dbg !1716
  store i32 %28, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1716
  %29 = tail call i32* @__errno_location() nounwind readnone, !dbg !1717
  store i32 5, i32* %29, align 4, !dbg !1717
  br label %bb7, !dbg !1718

bb2:                                              ; preds = %__get_sym_file.exit, %bb
  %30 = icmp eq %struct.exe_disk_file_t* %.0.i, null, !dbg !1719
  br i1 %30, label %bb4, label %bb3, !dbg !1719

bb3:                                              ; preds = %bb2
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %.0.i}, i64 0, metadata !594) nounwind, !dbg !1720
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !595) nounwind, !dbg !1720
  %31 = tail call i32 @geteuid() nounwind, !dbg !1722
  %32 = getelementptr inbounds %struct.exe_disk_file_t* %.0.i, i64 0, i32 2, !dbg !1722
  %33 = load %struct.stat** %32, align 8, !dbg !1722
  %34 = getelementptr inbounds %struct.stat* %33, i64 0, i32 4, !dbg !1722
  %35 = load i32* %34, align 4, !dbg !1722
  %36 = icmp eq i32 %31, %35, !dbg !1722
  br i1 %36, label %bb.i13, label %bb3.i14, !dbg !1722

bb.i13:                                           ; preds = %bb3
  %37 = tail call i32 @getgid() nounwind, !dbg !1723
  %38 = load %struct.stat** %32, align 8, !dbg !1723
  %39 = getelementptr inbounds %struct.stat* %38, i64 0, i32 5, !dbg !1723
  %40 = load i32* %39, align 8, !dbg !1723
  %41 = and i32 %mode, 3071, !dbg !1724
  %42 = icmp eq i32 %37, %40, !dbg !1723
  %mode..i = select i1 %42, i32 %mode, i32 %41
  %43 = getelementptr inbounds %struct.stat* %38, i64 0, i32 3, !dbg !1725
  %44 = load i32* %43, align 8, !dbg !1725
  %45 = and i32 %44, -4096, !dbg !1725
  %46 = and i32 %mode..i, 4095, !dbg !1725
  %47 = or i32 %46, %45, !dbg !1725
  store i32 %47, i32* %43, align 8, !dbg !1725
  br label %bb7, !dbg !1726

bb3.i14:                                          ; preds = %bb3
  %48 = tail call i32* @__errno_location() nounwind readnone, !dbg !1727
  store i32 1, i32* %48, align 4, !dbg !1727
  br label %bb7, !dbg !1728

bb4:                                              ; preds = %bb2
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !354) nounwind, !dbg !1729
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !344) nounwind, !dbg !1731
  %49 = ptrtoint i8* %path to i64, !dbg !1733
  %50 = tail call i64 @klee_get_valuel(i64 %49) nounwind, !dbg !1733
  %51 = inttoptr i64 %50 to i8*, !dbg !1733
  tail call void @llvm.dbg.value(metadata !{i8* %51}, i64 0, metadata !345) nounwind, !dbg !1733
  %52 = icmp eq i8* %51, %path, !dbg !1734
  %53 = zext i1 %52 to i64, !dbg !1734
  tail call void @klee_assume(i64 %53) nounwind, !dbg !1734
  tail call void @llvm.dbg.value(metadata !{i8* %51}, i64 0, metadata !355) nounwind, !dbg !1732
  tail call void @llvm.dbg.value(metadata !625, i64 0, metadata !357) nounwind, !dbg !1735
  br label %bb.i9, !dbg !1735

bb.i9:                                            ; preds = %bb6.i11, %bb4
  %sc.0.i = phi i8* [ %51, %bb4 ], [ %sc.1.i, %bb6.i11 ]
  %54 = phi i32 [ 0, %bb4 ], [ %66, %bb6.i11 ]
  %tmp.i = add i32 %54, -1
  %55 = load i8* %sc.0.i, align 1, !dbg !1736
  %56 = and i32 %tmp.i, %54, !dbg !1737
  %57 = icmp eq i32 %56, 0, !dbg !1737
  br i1 %57, label %bb1.i, label %bb5.i, !dbg !1737

bb1.i:                                            ; preds = %bb.i9
  switch i8 %55, label %bb6.i11 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i10
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %55}, i64 0, metadata !358) nounwind, !dbg !1736
  store i8 0, i8* %sc.0.i, align 1, !dbg !1738
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !355) nounwind, !dbg !1738
  br label %__concretize_string.exit, !dbg !1738

bb4.i10:                                          ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !1739
  %58 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1739
  br label %bb6.i11, !dbg !1739

bb5.i:                                            ; preds = %bb.i9
  %59 = sext i8 %55 to i64, !dbg !1740
  %60 = tail call i64 @klee_get_valuel(i64 %59) nounwind, !dbg !1740
  %61 = trunc i64 %60 to i8, !dbg !1740
  %62 = icmp eq i8 %61, %55, !dbg !1741
  %63 = zext i1 %62 to i64, !dbg !1741
  tail call void @klee_assume(i64 %63) nounwind, !dbg !1741
  store i8 %61, i8* %sc.0.i, align 1, !dbg !1742
  %64 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1742
  %65 = icmp eq i8 %61, 0, !dbg !1743
  br i1 %65, label %__concretize_string.exit, label %bb6.i11, !dbg !1743

bb6.i11:                                          ; preds = %bb5.i, %bb4.i10, %bb1.i
  %sc.1.i = phi i8* [ %58, %bb4.i10 ], [ %64, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %66 = add i32 %54, 1, !dbg !1735
  br label %bb.i9, !dbg !1735

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %67 = tail call i64 (i64, ...)* @syscall(i64 90, i8* %path, i32 %mode) nounwind, !dbg !1730
  %68 = trunc i64 %67 to i32, !dbg !1730
  tail call void @llvm.dbg.value(metadata !{i32 %68}, i64 0, metadata !606), !dbg !1730
  %69 = icmp eq i32 %68, -1, !dbg !1744
  br i1 %69, label %bb5, label %bb7, !dbg !1744

bb5:                                              ; preds = %__concretize_string.exit
  %70 = tail call i32* @__errno_location() nounwind readnone, !dbg !1745
  %71 = tail call i32 @klee_get_errno() nounwind, !dbg !1745
  store i32 %71, i32* %70, align 4, !dbg !1745
  br label %bb7, !dbg !1745

bb7:                                              ; preds = %bb3.i14, %bb.i13, %__concretize_string.exit, %bb5, %bb1
  %.0 = phi i32 [ -1, %bb1 ], [ -1, %bb5 ], [ %68, %__concretize_string.exit ], [ 0, %bb.i13 ], [ -1, %bb3.i14 ]
  ret i32 %.0, !dbg !1718
}

!llvm.dbg.sp = !{!0, !59, !72, !76, !79, !82, !85, !86, !87, !92, !97, !100, !131, !134, !137, !138, !142, !145, !148, !151, !154, !157, !158, !159, !170, !173, !176, !190, !191, !194, !195, !198, !201, !202, !205, !223, !226, !227, !230, !253, !254, !257, !258, !261, !264}
!llvm.dbg.lv.__get_sym_file = !{!267, !268, !270, !271}
!llvm.dbg.lv.__get_file = !{!273, !274}
!llvm.dbg.lv.umask = !{!277, !278}
!llvm.dbg.lv.has_permission = !{!280, !281, !282, !284, !285}
!llvm.dbg.lv.chroot = !{!286}
!llvm.dbg.lv.unlinkat = !{!287, !288, !289, !290}
!llvm.dbg.lv.unlink = !{!292, !293}
!llvm.dbg.lv.rmdir = !{!295, !296}
!llvm.dbg.lv.__df_chown = !{!298, !299, !300}
!llvm.dbg.lv.readlink = !{!301, !302, !303, !304, !306}
!llvm.dbg.lv.fsync = !{!308, !309, !311}
!llvm.dbg.lv.fstatfs = !{!313, !314, !315, !317}
!llvm.dbg.lv.__fd_ftruncate = !{!319, !320, !321, !323}
!llvm.dbg.gv = !{!325, !326, !327, !328, !329, !330, !331}
!llvm.dbg.lv.fchown = !{!332, !333, !334, !335, !337}
!llvm.dbg.lv.fchdir = !{!339, !340, !342}
!llvm.dbg.lv.__concretize_ptr = !{!344, !345}
!llvm.dbg.lv.__concretize_size = !{!347, !348}
!llvm.dbg.lv.getcwd = !{!350, !351, !352}
!llvm.dbg.lv.__concretize_string = !{!354, !355, !357, !358, !360}
!llvm.dbg.lv.__fd_statfs = !{!362, !363, !364, !366}
!llvm.dbg.lv.lchown = !{!368, !369, !370, !371, !373}
!llvm.dbg.lv.chown = !{!375, !376, !377, !378, !380}
!llvm.dbg.lv.chdir = !{!382, !383, !385}
!llvm.dbg.lv.utimes = !{!387, !388, !389, !391}
!llvm.dbg.lv.futimesat = !{!392, !393, !394, !395, !397}
!llvm.dbg.lv.access = !{!399, !400, !401, !403}
!llvm.dbg.lv.select = !{!405, !406, !407, !408, !409, !410, !412, !413, !414, !415, !416, !417, !418, !419, !420, !422, !424, !425}
!llvm.dbg.lv.close = !{!427, !428, !430}
!llvm.dbg.lv.dup2 = !{!431, !432, !433, !435}
!llvm.dbg.lv.dup = !{!437, !438, !440}
!llvm.dbg.lv.__fd_open = !{!442, !443, !444, !445, !447, !448, !449}
!llvm.dbg.lv.__fd_openat = !{!451, !452, !453, !454, !455, !457, !458, !459}
!llvm.dbg.lv.fcntl = !{!461, !462, !463, !465, !478, !479, !481}
!llvm.dbg.lv.ioctl = !{!483, !484, !485, !487, !488, !489, !491, !511, !521, !524}
!llvm.dbg.lv.__fd_getdents = !{!526, !527, !528, !529, !531, !533, !534, !535, !537, !539, !540, !541, !543}
!llvm.dbg.lv.__fd_lseek = !{!545, !546, !547, !548, !550}
!llvm.dbg.lv.__fd_fstat = !{!551, !552, !553, !555}
!llvm.dbg.lv.__fd_lstat = !{!557, !558, !559, !561}
!llvm.dbg.lv.fstatat = !{!563, !564, !565, !566, !567, !569, !570}
!llvm.dbg.lv.__fd_stat = !{!572, !573, !574, !576}
!llvm.dbg.lv.write = !{!578, !579, !580, !581, !583, !585}
!llvm.dbg.lv.read = !{!587, !588, !589, !590, !592}
!llvm.dbg.lv.__df_chmod = !{!594, !595}
!llvm.dbg.lv.fchmod = !{!596, !597, !598, !600}
!llvm.dbg.lv.chmod = !{!602, !603, !604, !606}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__get_sym_file", metadata !"__get_sym_file", metadata !"", metadata !1, i32 39, metadata !3, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"fd.c", metadata !"/home/qirong/Frog/frog_test/tools/KLEE_SOURCE_2015/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 1, metadata !"fd.c", metadata !"/home/qirong/Frog/frog_test/tools/KLEE_SOURCE_2015/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !57}
!5 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !6} ; [ DW_TAG_pointer_type ]
!6 = metadata !{i32 589846, metadata !7, metadata !"exe_disk_file_t", metadata !7, i32 26, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ]
!7 = metadata !{i32 589865, metadata !"fd.h", metadata !"/home/qirong/Frog/frog_test/tools/KLEE_SOURCE_2015/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!8 = metadata !{i32 589843, metadata !1, metadata !"", metadata !7, i32 20, i64 192, i64 64, i64 0, i32 0, null, metadata !9, i32 0, null} ; [ DW_TAG_structure_type ]
!9 = metadata !{metadata !10, metadata !12, metadata !15}
!10 = metadata !{i32 589837, metadata !8, metadata !"size", metadata !7, i32 21, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ]
!11 = metadata !{i32 589860, metadata !1, metadata !"unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!12 = metadata !{i32 589837, metadata !8, metadata !"contents", metadata !7, i32 22, i64 64, i64 64, i64 64, i32 0, metadata !13} ; [ DW_TAG_member ]
!13 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ]
!14 = metadata !{i32 589860, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!15 = metadata !{i32 589837, metadata !8, metadata !"stat", metadata !7, i32 23, i64 64, i64 64, i64 128, i32 0, metadata !16} ; [ DW_TAG_member ]
!16 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ]
!17 = metadata !{i32 589843, metadata !1, metadata !"stat64", metadata !7, i32 23, i64 1152, i64 64, i64 0, i32 0, null, metadata !18, i32 0, null} ; [ DW_TAG_structure_type ]
!18 = metadata !{metadata !19, metadata !24, metadata !26, metadata !28, metadata !30, metadata !32, metadata !34, metadata !36, metadata !37, metadata !40, metadata !42, metadata !44, metadata !51, metadata !52, metadata !53}
!19 = metadata !{i32 589837, metadata !17, metadata !"st_dev", metadata !20, i32 121, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_member ]
!20 = metadata !{i32 589865, metadata !"stat.h", metadata !"/usr/include/x86_64-linux-gnu/bits", metadata !2} ; [ DW_TAG_file_type ]
!21 = metadata !{i32 589846, metadata !22, metadata !"__dev_t", metadata !22, i32 135, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!22 = metadata !{i32 589865, metadata !"types.h", metadata !"/usr/include/x86_64-linux-gnu/bits", metadata !2} ; [ DW_TAG_file_type ]
!23 = metadata !{i32 589860, metadata !1, metadata !"long unsigned int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!24 = metadata !{i32 589837, metadata !17, metadata !"st_ino", metadata !20, i32 123, i64 64, i64 64, i64 64, i32 0, metadata !25} ; [ DW_TAG_member ]
!25 = metadata !{i32 589846, metadata !22, metadata !"__ino64_t", metadata !22, i32 139, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!26 = metadata !{i32 589837, metadata !17, metadata !"st_nlink", metadata !20, i32 124, i64 64, i64 64, i64 128, i32 0, metadata !27} ; [ DW_TAG_member ]
!27 = metadata !{i32 589846, metadata !22, metadata !"__nlink_t", metadata !22, i32 141, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!28 = metadata !{i32 589837, metadata !17, metadata !"st_mode", metadata !20, i32 125, i64 32, i64 32, i64 192, i32 0, metadata !29} ; [ DW_TAG_member ]
!29 = metadata !{i32 589846, metadata !22, metadata !"__mode_t", metadata !22, i32 140, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!30 = metadata !{i32 589837, metadata !17, metadata !"st_uid", metadata !20, i32 132, i64 32, i64 32, i64 224, i32 0, metadata !31} ; [ DW_TAG_member ]
!31 = metadata !{i32 589846, metadata !22, metadata !"__uid_t", metadata !22, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!32 = metadata !{i32 589837, metadata !17, metadata !"st_gid", metadata !20, i32 133, i64 32, i64 32, i64 256, i32 0, metadata !33} ; [ DW_TAG_member ]
!33 = metadata !{i32 589846, metadata !22, metadata !"__gid_t", metadata !22, i32 137, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!34 = metadata !{i32 589837, metadata !17, metadata !"__pad0", metadata !20, i32 135, i64 32, i64 32, i64 288, i32 0, metadata !35} ; [ DW_TAG_member ]
!35 = metadata !{i32 589860, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!36 = metadata !{i32 589837, metadata !17, metadata !"st_rdev", metadata !20, i32 136, i64 64, i64 64, i64 320, i32 0, metadata !21} ; [ DW_TAG_member ]
!37 = metadata !{i32 589837, metadata !17, metadata !"st_size", metadata !20, i32 137, i64 64, i64 64, i64 384, i32 0, metadata !38} ; [ DW_TAG_member ]
!38 = metadata !{i32 589846, metadata !22, metadata !"__off_t", metadata !22, i32 142, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!39 = metadata !{i32 589860, metadata !1, metadata !"long int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!40 = metadata !{i32 589837, metadata !17, metadata !"st_blksize", metadata !20, i32 143, i64 64, i64 64, i64 448, i32 0, metadata !41} ; [ DW_TAG_member ]
!41 = metadata !{i32 589846, metadata !22, metadata !"__blksize_t", metadata !22, i32 169, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!42 = metadata !{i32 589837, metadata !17, metadata !"st_blocks", metadata !20, i32 144, i64 64, i64 64, i64 512, i32 0, metadata !43} ; [ DW_TAG_member ]
!43 = metadata !{i32 589846, metadata !22, metadata !"__blkcnt64_t", metadata !22, i32 173, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!44 = metadata !{i32 589837, metadata !17, metadata !"st_atim", metadata !20, i32 152, i64 128, i64 64, i64 576, i32 0, metadata !45} ; [ DW_TAG_member ]
!45 = metadata !{i32 589843, metadata !1, metadata !"timespec", metadata !46, i32 121, i64 128, i64 64, i64 0, i32 0, null, metadata !47, i32 0, null} ; [ DW_TAG_structure_type ]
!46 = metadata !{i32 589865, metadata !"time.h", metadata !"/usr/include", metadata !2} ; [ DW_TAG_file_type ]
!47 = metadata !{metadata !48, metadata !50}
!48 = metadata !{i32 589837, metadata !45, metadata !"tv_sec", metadata !46, i32 122, i64 64, i64 64, i64 0, i32 0, metadata !49} ; [ DW_TAG_member ]
!49 = metadata !{i32 589846, metadata !22, metadata !"__time_t", metadata !22, i32 150, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!50 = metadata !{i32 589837, metadata !45, metadata !"tv_nsec", metadata !46, i32 123, i64 64, i64 64, i64 64, i32 0, metadata !39} ; [ DW_TAG_member ]
!51 = metadata !{i32 589837, metadata !17, metadata !"st_mtim", metadata !20, i32 153, i64 128, i64 64, i64 704, i32 0, metadata !45} ; [ DW_TAG_member ]
!52 = metadata !{i32 589837, metadata !17, metadata !"st_ctim", metadata !20, i32 154, i64 128, i64 64, i64 832, i32 0, metadata !45} ; [ DW_TAG_member ]
!53 = metadata !{i32 589837, metadata !17, metadata !"__unused", metadata !20, i32 167, i64 192, i64 64, i64 960, i32 0, metadata !54} ; [ DW_TAG_member ]
!54 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 192, i64 64, i64 0, i32 0, metadata !39, metadata !55, i32 0, null} ; [ DW_TAG_array_type ]
!55 = metadata !{metadata !56}
!56 = metadata !{i32 589857, i64 0, i64 2}        ; [ DW_TAG_subrange_type ]
!57 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !58} ; [ DW_TAG_pointer_type ]
!58 = metadata !{i32 589862, metadata !1, metadata !"", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !14} ; [ DW_TAG_const_type ]
!59 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__get_file", metadata !"__get_file", metadata !"", metadata !1, i32 63, metadata !60, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!60 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !61, i32 0, null} ; [ DW_TAG_subroutine_type ]
!61 = metadata !{metadata !62, metadata !35}
!62 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !63} ; [ DW_TAG_pointer_type ]
!63 = metadata !{i32 589846, metadata !7, metadata !"exe_file_t", metadata !7, i32 42, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ]
!64 = metadata !{i32 589843, metadata !1, metadata !"", metadata !7, i32 33, i64 192, i64 64, i64 0, i32 0, null, metadata !65, i32 0, null} ; [ DW_TAG_structure_type ]
!65 = metadata !{metadata !66, metadata !67, metadata !68, metadata !71}
!66 = metadata !{i32 589837, metadata !64, metadata !"fd", metadata !7, i32 34, i64 32, i64 32, i64 0, i32 0, metadata !35} ; [ DW_TAG_member ]
!67 = metadata !{i32 589837, metadata !64, metadata !"flags", metadata !7, i32 35, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ]
!68 = metadata !{i32 589837, metadata !64, metadata !"off", metadata !7, i32 38, i64 64, i64 64, i64 64, i32 0, metadata !69} ; [ DW_TAG_member ]
!69 = metadata !{i32 589846, metadata !70, metadata !"off64_t", metadata !70, i32 99, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!70 = metadata !{i32 589865, metadata !"types.h", metadata !"/usr/include/x86_64-linux-gnu/sys", metadata !2} ; [ DW_TAG_file_type ]
!71 = metadata !{i32 589837, metadata !64, metadata !"dfile", metadata !7, i32 39, i64 64, i64 64, i64 128, i32 0, metadata !5} ; [ DW_TAG_member ]
!72 = metadata !{i32 589870, i32 0, metadata !1, metadata !"umask", metadata !"umask", metadata !"umask", metadata !1, i32 88, metadata !73, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @umask} ; [ DW_TAG_subprogram ]
!73 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !74, i32 0, null} ; [ DW_TAG_subroutine_type ]
!74 = metadata !{metadata !75, metadata !75}
!75 = metadata !{i32 589846, metadata !70, metadata !"mode_t", metadata !70, i32 76, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!76 = metadata !{i32 589870, i32 0, metadata !1, metadata !"has_permission", metadata !"has_permission", metadata !"", metadata !1, i32 97, metadata !77, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!77 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !78, i32 0, null} ; [ DW_TAG_subroutine_type ]
!78 = metadata !{metadata !35, metadata !35, metadata !16}
!79 = metadata !{i32 589870, i32 0, metadata !1, metadata !"chroot", metadata !"chroot", metadata !"chroot", metadata !1, i32 1457, metadata !80, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @chroot} ; [ DW_TAG_subprogram ]
!80 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !81, i32 0, null} ; [ DW_TAG_subroutine_type ]
!81 = metadata !{metadata !35, metadata !57}
!82 = metadata !{i32 589870, i32 0, metadata !1, metadata !"unlinkat", metadata !"unlinkat", metadata !"unlinkat", metadata !1, i32 1239, metadata !83, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, i32)* @unlinkat} ; [ DW_TAG_subprogram ]
!83 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !84, i32 0, null} ; [ DW_TAG_subroutine_type ]
!84 = metadata !{metadata !35, metadata !35, metadata !57, metadata !35}
!85 = metadata !{i32 589870, i32 0, metadata !1, metadata !"unlink", metadata !"unlink", metadata !"unlink", metadata !1, i32 1218, metadata !80, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @unlink} ; [ DW_TAG_subprogram ]
!86 = metadata !{i32 589870, i32 0, metadata !1, metadata !"rmdir", metadata !"rmdir", metadata !"rmdir", metadata !1, i32 1200, metadata !80, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @rmdir} ; [ DW_TAG_subprogram ]
!87 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__df_chown", metadata !"__df_chown", metadata !"", metadata !1, i32 707, metadata !88, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!88 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !89, i32 0, null} ; [ DW_TAG_subroutine_type ]
!89 = metadata !{metadata !35, metadata !5, metadata !90, metadata !91}
!90 = metadata !{i32 589846, metadata !70, metadata !"uid_t", metadata !70, i32 87, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!91 = metadata !{i32 589846, metadata !70, metadata !"gid_t", metadata !70, i32 71, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!92 = metadata !{i32 589870, i32 0, metadata !1, metadata !"readlink", metadata !"readlink", metadata !"readlink", metadata !1, i32 1262, metadata !93, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i8*, i8*, i64)* @readlink} ; [ DW_TAG_subprogram ]
!93 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !94, i32 0, null} ; [ DW_TAG_subroutine_type ]
!94 = metadata !{metadata !95, metadata !57, metadata !13, metadata !96}
!95 = metadata !{i32 589846, metadata !70, metadata !"ssize_t", metadata !70, i32 116, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!96 = metadata !{i32 589846, metadata !70, metadata !"size_t", metadata !70, i32 151, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!97 = metadata !{i32 589870, i32 0, metadata !1, metadata !"fsync", metadata !"fsync", metadata !"fsync", metadata !1, i32 1140, metadata !98, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @fsync} ; [ DW_TAG_subprogram ]
!98 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !99, i32 0, null} ; [ DW_TAG_subroutine_type ]
!99 = metadata !{metadata !35, metadata !35}
!100 = metadata !{i32 589870, i32 0, metadata !1, metadata !"fstatfs", metadata !"fstatfs", metadata !"fstatfs", metadata !1, i32 1120, metadata !101, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.statfs*)* @fstatfs} ; [ DW_TAG_subprogram ]
!101 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !102, i32 0, null} ; [ DW_TAG_subroutine_type ]
!102 = metadata !{metadata !35, metadata !35, metadata !103}
!103 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !104} ; [ DW_TAG_pointer_type ]
!104 = metadata !{i32 589843, metadata !1, metadata !"statfs", metadata !105, i32 26, i64 960, i64 64, i64 0, i32 0, null, metadata !106, i32 0, null} ; [ DW_TAG_structure_type ]
!105 = metadata !{i32 589865, metadata !"statfs.h", metadata !"/usr/include/x86_64-linux-gnu/bits", metadata !2} ; [ DW_TAG_file_type ]
!106 = metadata !{metadata !107, metadata !108, metadata !109, metadata !111, metadata !112, metadata !113, metadata !115, metadata !116, metadata !124, metadata !125, metadata !126, metadata !127}
!107 = metadata !{i32 589837, metadata !104, metadata !"f_type", metadata !105, i32 27, i64 64, i64 64, i64 0, i32 0, metadata !39} ; [ DW_TAG_member ]
!108 = metadata !{i32 589837, metadata !104, metadata !"f_bsize", metadata !105, i32 28, i64 64, i64 64, i64 64, i32 0, metadata !39} ; [ DW_TAG_member ]
!109 = metadata !{i32 589837, metadata !104, metadata !"f_blocks", metadata !105, i32 30, i64 64, i64 64, i64 128, i32 0, metadata !110} ; [ DW_TAG_member ]
!110 = metadata !{i32 589846, metadata !22, metadata !"__fsblkcnt_t", metadata !22, i32 174, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!111 = metadata !{i32 589837, metadata !104, metadata !"f_bfree", metadata !105, i32 31, i64 64, i64 64, i64 192, i32 0, metadata !110} ; [ DW_TAG_member ]
!112 = metadata !{i32 589837, metadata !104, metadata !"f_bavail", metadata !105, i32 32, i64 64, i64 64, i64 256, i32 0, metadata !110} ; [ DW_TAG_member ]
!113 = metadata !{i32 589837, metadata !104, metadata !"f_files", metadata !105, i32 33, i64 64, i64 64, i64 320, i32 0, metadata !114} ; [ DW_TAG_member ]
!114 = metadata !{i32 589846, metadata !22, metadata !"__fsfilcnt_t", metadata !22, i32 178, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!115 = metadata !{i32 589837, metadata !104, metadata !"f_ffree", metadata !105, i32 34, i64 64, i64 64, i64 384, i32 0, metadata !114} ; [ DW_TAG_member ]
!116 = metadata !{i32 589837, metadata !104, metadata !"f_fsid", metadata !105, i32 42, i64 64, i64 32, i64 448, i32 0, metadata !117} ; [ DW_TAG_member ]
!117 = metadata !{i32 589846, metadata !22, metadata !"__fsid_t", metadata !22, i32 145, i64 0, i64 0, i64 0, i32 0, metadata !118} ; [ DW_TAG_typedef ]
!118 = metadata !{i32 589843, metadata !1, metadata !"", metadata !22, i32 144, i64 64, i64 32, i64 0, i32 0, null, metadata !119, i32 0, null} ; [ DW_TAG_structure_type ]
!119 = metadata !{metadata !120}
!120 = metadata !{i32 589837, metadata !118, metadata !"__val", metadata !22, i32 144, i64 64, i64 32, i64 0, i32 0, metadata !121} ; [ DW_TAG_member ]
!121 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !35, metadata !122, i32 0, null} ; [ DW_TAG_array_type ]
!122 = metadata !{metadata !123}
!123 = metadata !{i32 589857, i64 0, i64 1}       ; [ DW_TAG_subrange_type ]
!124 = metadata !{i32 589837, metadata !104, metadata !"f_namelen", metadata !105, i32 43, i64 64, i64 64, i64 512, i32 0, metadata !39} ; [ DW_TAG_member ]
!125 = metadata !{i32 589837, metadata !104, metadata !"f_frsize", metadata !105, i32 44, i64 64, i64 64, i64 576, i32 0, metadata !39} ; [ DW_TAG_member ]
!126 = metadata !{i32 589837, metadata !104, metadata !"f_flags", metadata !105, i32 45, i64 64, i64 64, i64 640, i32 0, metadata !39} ; [ DW_TAG_member ]
!127 = metadata !{i32 589837, metadata !104, metadata !"f_spare", metadata !105, i32 46, i64 256, i64 64, i64 704, i32 0, metadata !128} ; [ DW_TAG_member ]
!128 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 256, i64 64, i64 0, i32 0, metadata !39, metadata !129, i32 0, null} ; [ DW_TAG_array_type ]
!129 = metadata !{metadata !130}
!130 = metadata !{i32 589857, i64 0, i64 3}       ; [ DW_TAG_subrange_type ]
!131 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fd_ftruncate", metadata !"__fd_ftruncate", metadata !"__fd_ftruncate", metadata !1, i32 781, metadata !132, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @__fd_ftruncate} ; [ DW_TAG_subprogram ]
!132 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !133, i32 0, null} ; [ DW_TAG_subroutine_type ]
!133 = metadata !{metadata !35, metadata !35, metadata !69}
!134 = metadata !{i32 589870, i32 0, metadata !1, metadata !"fchown", metadata !"fchown", metadata !"fchown", metadata !1, i32 726, metadata !135, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @fchown} ; [ DW_TAG_subprogram ]
!135 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !136, i32 0, null} ; [ DW_TAG_subroutine_type ]
!136 = metadata !{metadata !35, metadata !35, metadata !90, metadata !91}
!137 = metadata !{i32 589870, i32 0, metadata !1, metadata !"fchdir", metadata !"fchdir", metadata !"fchdir", metadata !1, i32 624, metadata !98, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @fchdir} ; [ DW_TAG_subprogram ]
!138 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__concretize_ptr", metadata !"__concretize_ptr", metadata !"", metadata !1, i32 1415, metadata !139, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!139 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !140, i32 0, null} ; [ DW_TAG_subroutine_type ]
!140 = metadata !{metadata !141, metadata !141}
!141 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!142 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__concretize_size", metadata !"__concretize_size", metadata !"", metadata !1, i32 1422, metadata !143, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!143 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !144, i32 0, null} ; [ DW_TAG_subroutine_type ]
!144 = metadata !{metadata !96, metadata !96}
!145 = metadata !{i32 589870, i32 0, metadata !1, metadata !"getcwd", metadata !"getcwd", metadata !"getcwd", metadata !1, i32 1380, metadata !146, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i64)* @getcwd} ; [ DW_TAG_subprogram ]
!146 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !147, i32 0, null} ; [ DW_TAG_subroutine_type ]
!147 = metadata !{metadata !13, metadata !13, metadata !96}
!148 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__concretize_string", metadata !"__concretize_string", metadata !"", metadata !1, i32 1428, metadata !149, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!149 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !150, i32 0, null} ; [ DW_TAG_subroutine_type ]
!150 = metadata !{metadata !57, metadata !57}
!151 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fd_statfs", metadata !"__fd_statfs", metadata !"__fd_statfs", metadata !1, i32 1103, metadata !152, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.statfs*)* @__fd_statfs} ; [ DW_TAG_subprogram ]
!152 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !153, i32 0, null} ; [ DW_TAG_subroutine_type ]
!153 = metadata !{metadata !35, metadata !57, metadata !103}
!154 = metadata !{i32 589870, i32 0, metadata !1, metadata !"lchown", metadata !"lchown", metadata !"lchown", metadata !1, i32 744, metadata !155, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @lchown} ; [ DW_TAG_subprogram ]
!155 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !156, i32 0, null} ; [ DW_TAG_subroutine_type ]
!156 = metadata !{metadata !35, metadata !57, metadata !90, metadata !91}
!157 = metadata !{i32 589870, i32 0, metadata !1, metadata !"chown", metadata !"chown", metadata !"chown", metadata !1, i32 713, metadata !155, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @chown} ; [ DW_TAG_subprogram ]
!158 = metadata !{i32 589870, i32 0, metadata !1, metadata !"chdir", metadata !"chdir", metadata !"chdir", metadata !1, i32 606, metadata !80, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @chdir} ; [ DW_TAG_subprogram ]
!159 = metadata !{i32 589870, i32 0, metadata !1, metadata !"utimes", metadata !"utimes", metadata !"utimes", metadata !1, i32 256, metadata !160, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.timespec*)* @utimes} ; [ DW_TAG_subprogram ]
!160 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !161, i32 0, null} ; [ DW_TAG_subroutine_type ]
!161 = metadata !{metadata !35, metadata !57, metadata !162}
!162 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !163} ; [ DW_TAG_pointer_type ]
!163 = metadata !{i32 589862, metadata !1, metadata !"", metadata !1, i32 0, i64 128, i64 64, i64 0, i32 0, metadata !164} ; [ DW_TAG_const_type ]
!164 = metadata !{i32 589843, metadata !1, metadata !"timeval", metadata !165, i32 32, i64 128, i64 64, i64 0, i32 0, null, metadata !166, i32 0, null} ; [ DW_TAG_structure_type ]
!165 = metadata !{i32 589865, metadata !"time.h", metadata !"/usr/include/x86_64-linux-gnu/bits", metadata !2} ; [ DW_TAG_file_type ]
!166 = metadata !{metadata !167, metadata !168}
!167 = metadata !{i32 589837, metadata !164, metadata !"tv_sec", metadata !165, i32 33, i64 64, i64 64, i64 0, i32 0, metadata !49} ; [ DW_TAG_member ]
!168 = metadata !{i32 589837, metadata !164, metadata !"tv_usec", metadata !165, i32 34, i64 64, i64 64, i64 64, i32 0, metadata !169} ; [ DW_TAG_member ]
!169 = metadata !{i32 589846, metadata !22, metadata !"__suseconds_t", metadata !22, i32 153, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!170 = metadata !{i32 589870, i32 0, metadata !1, metadata !"futimesat", metadata !"futimesat", metadata !"futimesat", metadata !1, i32 277, metadata !171, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.timespec*)* @futimesat} ; [ DW_TAG_subprogram ]
!171 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !172, i32 0, null} ; [ DW_TAG_subroutine_type ]
!172 = metadata !{metadata !35, metadata !35, metadata !57, metadata !162}
!173 = metadata !{i32 589870, i32 0, metadata !1, metadata !"access", metadata !"access", metadata !"access", metadata !1, i32 73, metadata !174, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @access} ; [ DW_TAG_subprogram ]
!174 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !175, i32 0, null} ; [ DW_TAG_subroutine_type ]
!175 = metadata !{metadata !35, metadata !57, metadata !35}
!176 = metadata !{i32 589870, i32 0, metadata !1, metadata !"select", metadata !"select", metadata !"select", metadata !1, i32 1295, metadata !177, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.fd_set*, %struct.fd_set*, %struct.fd_set*, %struct.timespec*)* @select} ; [ DW_TAG_subprogram ]
!177 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !178, i32 0, null} ; [ DW_TAG_subroutine_type ]
!178 = metadata !{metadata !35, metadata !35, metadata !179, metadata !179, metadata !179, metadata !189}
!179 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !180} ; [ DW_TAG_pointer_type ]
!180 = metadata !{i32 589846, metadata !181, metadata !"fd_set", metadata !181, i32 83, i64 0, i64 0, i64 0, i32 0, metadata !182} ; [ DW_TAG_typedef ]
!181 = metadata !{i32 589865, metadata !"select.h", metadata !"/usr/include/x86_64-linux-gnu/sys", metadata !2} ; [ DW_TAG_file_type ]
!182 = metadata !{i32 589843, metadata !1, metadata !"", metadata !181, i32 66, i64 1024, i64 64, i64 0, i32 0, null, metadata !183, i32 0, null} ; [ DW_TAG_structure_type ]
!183 = metadata !{metadata !184}
!184 = metadata !{i32 589837, metadata !182, metadata !"fds_bits", metadata !181, i32 70, i64 1024, i64 64, i64 0, i32 0, metadata !185} ; [ DW_TAG_member ]
!185 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 1024, i64 64, i64 0, i32 0, metadata !186, metadata !187, i32 0, null} ; [ DW_TAG_array_type ]
!186 = metadata !{i32 589846, metadata !181, metadata !"__fd_mask", metadata !181, i32 66, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!187 = metadata !{metadata !188}
!188 = metadata !{i32 589857, i64 0, i64 15}      ; [ DW_TAG_subrange_type ]
!189 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !164} ; [ DW_TAG_pointer_type ]
!190 = metadata !{i32 589870, i32 0, metadata !1, metadata !"close", metadata !"close", metadata !"close", metadata !1, i32 303, metadata !98, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @close} ; [ DW_TAG_subprogram ]
!191 = metadata !{i32 589870, i32 0, metadata !1, metadata !"dup2", metadata !"dup2", metadata !"dup2", metadata !1, i32 1156, metadata !192, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @dup2} ; [ DW_TAG_subprogram ]
!192 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !193, i32 0, null} ; [ DW_TAG_subroutine_type ]
!193 = metadata !{metadata !35, metadata !35, metadata !35}
!194 = metadata !{i32 589870, i32 0, metadata !1, metadata !"dup", metadata !"dup", metadata !"dup", metadata !1, i32 1181, metadata !98, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @dup} ; [ DW_TAG_subprogram ]
!195 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fd_open", metadata !"__fd_open", metadata !"__fd_open", metadata !1, i32 128, metadata !196, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @__fd_open} ; [ DW_TAG_subprogram ]
!196 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !197, i32 0, null} ; [ DW_TAG_subroutine_type ]
!197 = metadata !{metadata !35, metadata !57, metadata !35, metadata !75}
!198 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fd_openat", metadata !"__fd_openat", metadata !"__fd_openat", metadata !1, i32 201, metadata !199, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, i32, i32)* @__fd_openat} ; [ DW_TAG_subprogram ]
!199 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !200, i32 0, null} ; [ DW_TAG_subroutine_type ]
!200 = metadata !{metadata !35, metadata !35, metadata !57, metadata !35, metadata !75}
!201 = metadata !{i32 589870, i32 0, metadata !1, metadata !"fcntl", metadata !"fcntl", metadata !"fcntl", metadata !1, i32 1048, metadata !192, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, ...)* @fcntl} ; [ DW_TAG_subprogram ]
!202 = metadata !{i32 589870, i32 0, metadata !1, metadata !"ioctl", metadata !"ioctl", metadata !"ioctl", metadata !1, i32 898, metadata !203, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64, ...)* @ioctl} ; [ DW_TAG_subprogram ]
!203 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !204, i32 0, null} ; [ DW_TAG_subroutine_type ]
!204 = metadata !{metadata !35, metadata !35, metadata !23}
!205 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fd_getdents", metadata !"__fd_getdents", metadata !"__fd_getdents", metadata !1, i32 814, metadata !206, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.dirent64*, i32)* @__fd_getdents} ; [ DW_TAG_subprogram ]
!206 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !207, i32 0, null} ; [ DW_TAG_subroutine_type ]
!207 = metadata !{metadata !35, metadata !11, metadata !208, metadata !11}
!208 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !209} ; [ DW_TAG_pointer_type ]
!209 = metadata !{i32 589843, metadata !1, metadata !"dirent64", metadata !210, i32 39, i64 2240, i64 64, i64 0, i32 0, null, metadata !211, i32 0, null} ; [ DW_TAG_structure_type ]
!210 = metadata !{i32 589865, metadata !"dirent.h", metadata !"/usr/include/x86_64-linux-gnu/bits", metadata !2} ; [ DW_TAG_file_type ]
!211 = metadata !{metadata !212, metadata !213, metadata !215, metadata !217, metadata !219}
!212 = metadata !{i32 589837, metadata !209, metadata !"d_ino", metadata !210, i32 40, i64 64, i64 64, i64 0, i32 0, metadata !25} ; [ DW_TAG_member ]
!213 = metadata !{i32 589837, metadata !209, metadata !"d_off", metadata !210, i32 41, i64 64, i64 64, i64 64, i32 0, metadata !214} ; [ DW_TAG_member ]
!214 = metadata !{i32 589846, metadata !22, metadata !"__off64_t", metadata !22, i32 143, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!215 = metadata !{i32 589837, metadata !209, metadata !"d_reclen", metadata !210, i32 42, i64 16, i64 16, i64 128, i32 0, metadata !216} ; [ DW_TAG_member ]
!216 = metadata !{i32 589860, metadata !1, metadata !"short unsigned int", metadata !1, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!217 = metadata !{i32 589837, metadata !209, metadata !"d_type", metadata !210, i32 43, i64 8, i64 8, i64 144, i32 0, metadata !218} ; [ DW_TAG_member ]
!218 = metadata !{i32 589860, metadata !1, metadata !"unsigned char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!219 = metadata !{i32 589837, metadata !209, metadata !"d_name", metadata !210, i32 44, i64 2048, i64 8, i64 152, i32 0, metadata !220} ; [ DW_TAG_member ]
!220 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 2048, i64 8, i64 0, i32 0, metadata !14, metadata !221, i32 0, null} ; [ DW_TAG_array_type ]
!221 = metadata !{metadata !222}
!222 = metadata !{i32 589857, i64 0, i64 255}     ; [ DW_TAG_subrange_type ]
!223 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fd_lseek", metadata !"__fd_lseek", metadata !"__fd_lseek", metadata !1, i32 475, metadata !224, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i64, i32)* @__fd_lseek} ; [ DW_TAG_subprogram ]
!224 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !225, i32 0, null} ; [ DW_TAG_subroutine_type ]
!225 = metadata !{metadata !69, metadata !35, metadata !69, metadata !35}
!226 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fd_fstat", metadata !"__fd_fstat", metadata !"__fd_fstat", metadata !1, i32 758, metadata !77, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.stat*)* @__fd_fstat} ; [ DW_TAG_subprogram ]
!227 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fd_lstat", metadata !"__fd_lstat", metadata !"__fd_lstat", metadata !1, i32 587, metadata !228, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat*)* @__fd_lstat} ; [ DW_TAG_subprogram ]
!228 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !229, i32 0, null} ; [ DW_TAG_subroutine_type ]
!229 = metadata !{metadata !35, metadata !57, metadata !16}
!230 = metadata !{i32 589870, i32 0, metadata !1, metadata !"fstatat", metadata !"fstatat", metadata !"fstatat", metadata !1, i32 551, metadata !231, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*, i32)* @fstatat} ; [ DW_TAG_subprogram ]
!231 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !232, i32 0, null} ; [ DW_TAG_subroutine_type ]
!232 = metadata !{metadata !35, metadata !35, metadata !57, metadata !233, metadata !35}
!233 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !234} ; [ DW_TAG_pointer_type ]
!234 = metadata !{i32 589843, metadata !1, metadata !"stat", metadata !20, i32 47, i64 1152, i64 64, i64 0, i32 0, null, metadata !235, i32 0, null} ; [ DW_TAG_structure_type ]
!235 = metadata !{metadata !236, metadata !237, metadata !239, metadata !240, metadata !241, metadata !242, metadata !243, metadata !244, metadata !245, metadata !246, metadata !247, metadata !249, metadata !250, metadata !251, metadata !252}
!236 = metadata !{i32 589837, metadata !234, metadata !"st_dev", metadata !20, i32 48, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_member ]
!237 = metadata !{i32 589837, metadata !234, metadata !"st_ino", metadata !20, i32 53, i64 64, i64 64, i64 64, i32 0, metadata !238} ; [ DW_TAG_member ]
!238 = metadata !{i32 589846, metadata !22, metadata !"__ino_t", metadata !22, i32 138, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!239 = metadata !{i32 589837, metadata !234, metadata !"st_nlink", metadata !20, i32 61, i64 64, i64 64, i64 128, i32 0, metadata !27} ; [ DW_TAG_member ]
!240 = metadata !{i32 589837, metadata !234, metadata !"st_mode", metadata !20, i32 62, i64 32, i64 32, i64 192, i32 0, metadata !29} ; [ DW_TAG_member ]
!241 = metadata !{i32 589837, metadata !234, metadata !"st_uid", metadata !20, i32 64, i64 32, i64 32, i64 224, i32 0, metadata !31} ; [ DW_TAG_member ]
!242 = metadata !{i32 589837, metadata !234, metadata !"st_gid", metadata !20, i32 65, i64 32, i64 32, i64 256, i32 0, metadata !33} ; [ DW_TAG_member ]
!243 = metadata !{i32 589837, metadata !234, metadata !"__pad0", metadata !20, i32 67, i64 32, i64 32, i64 288, i32 0, metadata !35} ; [ DW_TAG_member ]
!244 = metadata !{i32 589837, metadata !234, metadata !"st_rdev", metadata !20, i32 69, i64 64, i64 64, i64 320, i32 0, metadata !21} ; [ DW_TAG_member ]
!245 = metadata !{i32 589837, metadata !234, metadata !"st_size", metadata !20, i32 74, i64 64, i64 64, i64 384, i32 0, metadata !38} ; [ DW_TAG_member ]
!246 = metadata !{i32 589837, metadata !234, metadata !"st_blksize", metadata !20, i32 78, i64 64, i64 64, i64 448, i32 0, metadata !41} ; [ DW_TAG_member ]
!247 = metadata !{i32 589837, metadata !234, metadata !"st_blocks", metadata !20, i32 80, i64 64, i64 64, i64 512, i32 0, metadata !248} ; [ DW_TAG_member ]
!248 = metadata !{i32 589846, metadata !22, metadata !"__blkcnt_t", metadata !22, i32 170, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!249 = metadata !{i32 589837, metadata !234, metadata !"st_atim", metadata !20, i32 91, i64 128, i64 64, i64 576, i32 0, metadata !45} ; [ DW_TAG_member ]
!250 = metadata !{i32 589837, metadata !234, metadata !"st_mtim", metadata !20, i32 92, i64 128, i64 64, i64 704, i32 0, metadata !45} ; [ DW_TAG_member ]
!251 = metadata !{i32 589837, metadata !234, metadata !"st_ctim", metadata !20, i32 93, i64 128, i64 64, i64 832, i32 0, metadata !45} ; [ DW_TAG_member ]
!252 = metadata !{i32 589837, metadata !234, metadata !"__unused", metadata !20, i32 106, i64 192, i64 64, i64 960, i32 0, metadata !54} ; [ DW_TAG_member ]
!253 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fd_stat", metadata !"__fd_stat", metadata !"__fd_stat", metadata !1, i32 532, metadata !228, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat*)* @__fd_stat} ; [ DW_TAG_subprogram ]
!254 = metadata !{i32 589870, i32 0, metadata !1, metadata !"write", metadata !"write", metadata !"write", metadata !1, i32 403, metadata !255, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i8*, i64)* @write} ; [ DW_TAG_subprogram ]
!255 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !256, i32 0, null} ; [ DW_TAG_subroutine_type ]
!256 = metadata !{metadata !95, metadata !35, metadata !141, metadata !96}
!257 = metadata !{i32 589870, i32 0, metadata !1, metadata !"read", metadata !"read", metadata !"read", metadata !1, i32 335, metadata !255, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i8*, i64)* @read} ; [ DW_TAG_subprogram ]
!258 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__df_chmod", metadata !"__df_chmod", metadata !"", metadata !1, i32 645, metadata !259, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!259 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !260, i32 0, null} ; [ DW_TAG_subroutine_type ]
!260 = metadata !{metadata !35, metadata !5, metadata !75}
!261 = metadata !{i32 589870, i32 0, metadata !1, metadata !"fchmod", metadata !"fchmod", metadata !"fchmod", metadata !1, i32 680, metadata !262, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @fchmod} ; [ DW_TAG_subprogram ]
!262 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !263, i32 0, null} ; [ DW_TAG_subroutine_type ]
!263 = metadata !{metadata !35, metadata !35, metadata !75}
!264 = metadata !{i32 589870, i32 0, metadata !1, metadata !"chmod", metadata !"chmod", metadata !"chmod", metadata !1, i32 658, metadata !265, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @chmod} ; [ DW_TAG_subprogram ]
!265 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !266, i32 0, null} ; [ DW_TAG_subroutine_type ]
!266 = metadata !{metadata !35, metadata !57, metadata !75}
!267 = metadata !{i32 590081, metadata !0, metadata !"pathname", metadata !1, i32 39, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!268 = metadata !{i32 590080, metadata !269, metadata !"c", metadata !1, i32 40, metadata !14, i32 0} ; [ DW_TAG_auto_variable ]
!269 = metadata !{i32 589835, metadata !0, i32 39, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!270 = metadata !{i32 590080, metadata !269, metadata !"i", metadata !1, i32 41, metadata !11, i32 0} ; [ DW_TAG_auto_variable ]
!271 = metadata !{i32 590080, metadata !272, metadata !"df", metadata !1, i32 48, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!272 = metadata !{i32 589835, metadata !269, i32 48, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!273 = metadata !{i32 590081, metadata !59, metadata !"fd", metadata !1, i32 63, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!274 = metadata !{i32 590080, metadata !275, metadata !"f", metadata !1, i32 65, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!275 = metadata !{i32 589835, metadata !276, i32 63, i32 0, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!276 = metadata !{i32 589835, metadata !59, i32 63, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!277 = metadata !{i32 590081, metadata !72, metadata !"mask", metadata !1, i32 88, metadata !75, i32 0} ; [ DW_TAG_arg_variable ]
!278 = metadata !{i32 590080, metadata !279, metadata !"r", metadata !1, i32 89, metadata !75, i32 0} ; [ DW_TAG_auto_variable ]
!279 = metadata !{i32 589835, metadata !72, i32 88, i32 0, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!280 = metadata !{i32 590081, metadata !76, metadata !"flags", metadata !1, i32 97, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!281 = metadata !{i32 590081, metadata !76, metadata !"s", metadata !1, i32 97, metadata !16, i32 0} ; [ DW_TAG_arg_variable ]
!282 = metadata !{i32 590080, metadata !283, metadata !"write_access", metadata !1, i32 98, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!283 = metadata !{i32 589835, metadata !76, i32 97, i32 0, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
!284 = metadata !{i32 590080, metadata !283, metadata !"read_access", metadata !1, i32 98, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!285 = metadata !{i32 590080, metadata !283, metadata !"mode", metadata !1, i32 99, metadata !75, i32 0} ; [ DW_TAG_auto_variable ]
!286 = metadata !{i32 590081, metadata !79, metadata !"path", metadata !1, i32 1457, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!287 = metadata !{i32 590081, metadata !82, metadata !"dirfd", metadata !1, i32 1239, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!288 = metadata !{i32 590081, metadata !82, metadata !"pathname", metadata !1, i32 1239, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!289 = metadata !{i32 590081, metadata !82, metadata !"flags", metadata !1, i32 1239, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!290 = metadata !{i32 590080, metadata !291, metadata !"dfile", metadata !1, i32 1242, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!291 = metadata !{i32 589835, metadata !82, i32 1239, i32 0, metadata !1, i32 7} ; [ DW_TAG_lexical_block ]
!292 = metadata !{i32 590081, metadata !85, metadata !"pathname", metadata !1, i32 1218, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!293 = metadata !{i32 590080, metadata !294, metadata !"dfile", metadata !1, i32 1219, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!294 = metadata !{i32 589835, metadata !85, i32 1218, i32 0, metadata !1, i32 8} ; [ DW_TAG_lexical_block ]
!295 = metadata !{i32 590081, metadata !86, metadata !"pathname", metadata !1, i32 1200, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!296 = metadata !{i32 590080, metadata !297, metadata !"dfile", metadata !1, i32 1201, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!297 = metadata !{i32 589835, metadata !86, i32 1200, i32 0, metadata !1, i32 9} ; [ DW_TAG_lexical_block ]
!298 = metadata !{i32 590081, metadata !87, metadata !"df", metadata !1, i32 707, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!299 = metadata !{i32 590081, metadata !87, metadata !"owner", metadata !1, i32 707, metadata !90, i32 0} ; [ DW_TAG_arg_variable ]
!300 = metadata !{i32 590081, metadata !87, metadata !"group", metadata !1, i32 707, metadata !91, i32 0} ; [ DW_TAG_arg_variable ]
!301 = metadata !{i32 590081, metadata !92, metadata !"path", metadata !1, i32 1262, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!302 = metadata !{i32 590081, metadata !92, metadata !"buf", metadata !1, i32 1262, metadata !13, i32 0} ; [ DW_TAG_arg_variable ]
!303 = metadata !{i32 590081, metadata !92, metadata !"bufsize", metadata !1, i32 1262, metadata !96, i32 0} ; [ DW_TAG_arg_variable ]
!304 = metadata !{i32 590080, metadata !305, metadata !"dfile", metadata !1, i32 1263, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!305 = metadata !{i32 589835, metadata !92, i32 1262, i32 0, metadata !1, i32 11} ; [ DW_TAG_lexical_block ]
!306 = metadata !{i32 590080, metadata !307, metadata !"r", metadata !1, i32 1279, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!307 = metadata !{i32 589835, metadata !305, i32 1279, i32 0, metadata !1, i32 12} ; [ DW_TAG_lexical_block ]
!308 = metadata !{i32 590081, metadata !97, metadata !"fd", metadata !1, i32 1140, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!309 = metadata !{i32 590080, metadata !310, metadata !"f", metadata !1, i32 1141, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!310 = metadata !{i32 589835, metadata !97, i32 1140, i32 0, metadata !1, i32 13} ; [ DW_TAG_lexical_block ]
!311 = metadata !{i32 590080, metadata !312, metadata !"r", metadata !1, i32 1149, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!312 = metadata !{i32 589835, metadata !310, i32 1149, i32 0, metadata !1, i32 14} ; [ DW_TAG_lexical_block ]
!313 = metadata !{i32 590081, metadata !100, metadata !"fd", metadata !1, i32 1120, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!314 = metadata !{i32 590081, metadata !100, metadata !"buf", metadata !1, i32 1120, metadata !103, i32 0} ; [ DW_TAG_arg_variable ]
!315 = metadata !{i32 590080, metadata !316, metadata !"f", metadata !1, i32 1121, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!316 = metadata !{i32 589835, metadata !100, i32 1120, i32 0, metadata !1, i32 15} ; [ DW_TAG_lexical_block ]
!317 = metadata !{i32 590080, metadata !318, metadata !"r", metadata !1, i32 1133, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!318 = metadata !{i32 589835, metadata !316, i32 1133, i32 0, metadata !1, i32 16} ; [ DW_TAG_lexical_block ]
!319 = metadata !{i32 590081, metadata !131, metadata !"fd", metadata !1, i32 781, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!320 = metadata !{i32 590081, metadata !131, metadata !"length", metadata !1, i32 781, metadata !69, i32 0} ; [ DW_TAG_arg_variable ]
!321 = metadata !{i32 590080, metadata !322, metadata !"f", metadata !1, i32 783, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!322 = metadata !{i32 589835, metadata !131, i32 781, i32 0, metadata !1, i32 17} ; [ DW_TAG_lexical_block ]
!323 = metadata !{i32 590080, metadata !324, metadata !"r", metadata !1, i32 804, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!324 = metadata !{i32 589835, metadata !322, i32 804, i32 0, metadata !1, i32 18} ; [ DW_TAG_lexical_block ]
!325 = metadata !{i32 589876, i32 0, metadata !131, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 782, metadata !35, i1 true, i1 true, i32* @n_calls.5261} ; [ DW_TAG_variable ]
!326 = metadata !{i32 589876, i32 0, metadata !145, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 1381, metadata !35, i1 true, i1 true, i32* @n_calls.5837} ; [ DW_TAG_variable ]
!327 = metadata !{i32 589876, i32 0, metadata !190, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 304, metadata !35, i1 true, i1 true, i32* @n_calls.4869} ; [ DW_TAG_variable ]
!328 = metadata !{i32 589876, i32 0, metadata !254, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 404, metadata !35, i1 true, i1 true, i32* @n_calls.4950} ; [ DW_TAG_variable ]
!329 = metadata !{i32 589876, i32 0, metadata !257, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 336, metadata !35, i1 true, i1 true, i32* @n_calls.4889} ; [ DW_TAG_variable ]
!330 = metadata !{i32 589876, i32 0, metadata !261, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 681, metadata !35, i1 true, i1 true, i32* @n_calls.5168} ; [ DW_TAG_variable ]
!331 = metadata !{i32 589876, i32 0, metadata !264, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 659, metadata !35, i1 true, i1 true, i32* @n_calls.5145} ; [ DW_TAG_variable ]
!332 = metadata !{i32 590081, metadata !134, metadata !"fd", metadata !1, i32 726, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!333 = metadata !{i32 590081, metadata !134, metadata !"owner", metadata !1, i32 726, metadata !90, i32 0} ; [ DW_TAG_arg_variable ]
!334 = metadata !{i32 590081, metadata !134, metadata !"group", metadata !1, i32 726, metadata !91, i32 0} ; [ DW_TAG_arg_variable ]
!335 = metadata !{i32 590080, metadata !336, metadata !"f", metadata !1, i32 727, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!336 = metadata !{i32 589835, metadata !134, i32 726, i32 0, metadata !1, i32 19} ; [ DW_TAG_lexical_block ]
!337 = metadata !{i32 590080, metadata !338, metadata !"r", metadata !1, i32 737, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!338 = metadata !{i32 589835, metadata !336, i32 737, i32 0, metadata !1, i32 20} ; [ DW_TAG_lexical_block ]
!339 = metadata !{i32 590081, metadata !137, metadata !"fd", metadata !1, i32 624, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!340 = metadata !{i32 590080, metadata !341, metadata !"f", metadata !1, i32 625, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!341 = metadata !{i32 589835, metadata !137, i32 624, i32 0, metadata !1, i32 21} ; [ DW_TAG_lexical_block ]
!342 = metadata !{i32 590080, metadata !343, metadata !"r", metadata !1, i32 637, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!343 = metadata !{i32 589835, metadata !341, i32 637, i32 0, metadata !1, i32 22} ; [ DW_TAG_lexical_block ]
!344 = metadata !{i32 590081, metadata !138, metadata !"p", metadata !1, i32 1415, metadata !141, i32 0} ; [ DW_TAG_arg_variable ]
!345 = metadata !{i32 590080, metadata !346, metadata !"pc", metadata !1, i32 1417, metadata !13, i32 0} ; [ DW_TAG_auto_variable ]
!346 = metadata !{i32 589835, metadata !138, i32 1415, i32 0, metadata !1, i32 23} ; [ DW_TAG_lexical_block ]
!347 = metadata !{i32 590081, metadata !142, metadata !"s", metadata !1, i32 1422, metadata !96, i32 0} ; [ DW_TAG_arg_variable ]
!348 = metadata !{i32 590080, metadata !349, metadata !"sc", metadata !1, i32 1423, metadata !96, i32 0} ; [ DW_TAG_auto_variable ]
!349 = metadata !{i32 589835, metadata !142, i32 1422, i32 0, metadata !1, i32 24} ; [ DW_TAG_lexical_block ]
!350 = metadata !{i32 590081, metadata !145, metadata !"buf", metadata !1, i32 1380, metadata !13, i32 0} ; [ DW_TAG_arg_variable ]
!351 = metadata !{i32 590081, metadata !145, metadata !"size", metadata !1, i32 1380, metadata !96, i32 0} ; [ DW_TAG_arg_variable ]
!352 = metadata !{i32 590080, metadata !353, metadata !"r", metadata !1, i32 1382, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!353 = metadata !{i32 589835, metadata !145, i32 1380, i32 0, metadata !1, i32 25} ; [ DW_TAG_lexical_block ]
!354 = metadata !{i32 590081, metadata !148, metadata !"s", metadata !1, i32 1428, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!355 = metadata !{i32 590080, metadata !356, metadata !"sc", metadata !1, i32 1429, metadata !13, i32 0} ; [ DW_TAG_auto_variable ]
!356 = metadata !{i32 589835, metadata !148, i32 1428, i32 0, metadata !1, i32 26} ; [ DW_TAG_lexical_block ]
!357 = metadata !{i32 590080, metadata !356, metadata !"i", metadata !1, i32 1430, metadata !11, i32 0} ; [ DW_TAG_auto_variable ]
!358 = metadata !{i32 590080, metadata !359, metadata !"c", metadata !1, i32 1433, metadata !14, i32 0} ; [ DW_TAG_auto_variable ]
!359 = metadata !{i32 589835, metadata !356, i32 1433, i32 0, metadata !1, i32 27} ; [ DW_TAG_lexical_block ]
!360 = metadata !{i32 590080, metadata !361, metadata !"cc", metadata !1, i32 1442, metadata !14, i32 0} ; [ DW_TAG_auto_variable ]
!361 = metadata !{i32 589835, metadata !359, i32 1442, i32 0, metadata !1, i32 28} ; [ DW_TAG_lexical_block ]
!362 = metadata !{i32 590081, metadata !151, metadata !"path", metadata !1, i32 1103, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!363 = metadata !{i32 590081, metadata !151, metadata !"buf", metadata !1, i32 1103, metadata !103, i32 0} ; [ DW_TAG_arg_variable ]
!364 = metadata !{i32 590080, metadata !365, metadata !"dfile", metadata !1, i32 1104, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!365 = metadata !{i32 589835, metadata !151, i32 1103, i32 0, metadata !1, i32 29} ; [ DW_TAG_lexical_block ]
!366 = metadata !{i32 590080, metadata !367, metadata !"r", metadata !1, i32 1113, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!367 = metadata !{i32 589835, metadata !365, i32 1113, i32 0, metadata !1, i32 30} ; [ DW_TAG_lexical_block ]
!368 = metadata !{i32 590081, metadata !154, metadata !"path", metadata !1, i32 744, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!369 = metadata !{i32 590081, metadata !154, metadata !"owner", metadata !1, i32 744, metadata !90, i32 0} ; [ DW_TAG_arg_variable ]
!370 = metadata !{i32 590081, metadata !154, metadata !"group", metadata !1, i32 744, metadata !91, i32 0} ; [ DW_TAG_arg_variable ]
!371 = metadata !{i32 590080, metadata !372, metadata !"df", metadata !1, i32 746, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!372 = metadata !{i32 589835, metadata !154, i32 744, i32 0, metadata !1, i32 31} ; [ DW_TAG_lexical_block ]
!373 = metadata !{i32 590080, metadata !374, metadata !"r", metadata !1, i32 751, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!374 = metadata !{i32 589835, metadata !372, i32 751, i32 0, metadata !1, i32 32} ; [ DW_TAG_lexical_block ]
!375 = metadata !{i32 590081, metadata !157, metadata !"path", metadata !1, i32 713, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!376 = metadata !{i32 590081, metadata !157, metadata !"owner", metadata !1, i32 713, metadata !90, i32 0} ; [ DW_TAG_arg_variable ]
!377 = metadata !{i32 590081, metadata !157, metadata !"group", metadata !1, i32 713, metadata !91, i32 0} ; [ DW_TAG_arg_variable ]
!378 = metadata !{i32 590080, metadata !379, metadata !"df", metadata !1, i32 714, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!379 = metadata !{i32 589835, metadata !157, i32 713, i32 0, metadata !1, i32 33} ; [ DW_TAG_lexical_block ]
!380 = metadata !{i32 590080, metadata !381, metadata !"r", metadata !1, i32 719, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!381 = metadata !{i32 589835, metadata !379, i32 719, i32 0, metadata !1, i32 34} ; [ DW_TAG_lexical_block ]
!382 = metadata !{i32 590081, metadata !158, metadata !"path", metadata !1, i32 606, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!383 = metadata !{i32 590080, metadata !384, metadata !"dfile", metadata !1, i32 607, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!384 = metadata !{i32 589835, metadata !158, i32 606, i32 0, metadata !1, i32 35} ; [ DW_TAG_lexical_block ]
!385 = metadata !{i32 590080, metadata !386, metadata !"r", metadata !1, i32 617, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!386 = metadata !{i32 589835, metadata !384, i32 617, i32 0, metadata !1, i32 36} ; [ DW_TAG_lexical_block ]
!387 = metadata !{i32 590081, metadata !159, metadata !"path", metadata !1, i32 256, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!388 = metadata !{i32 590081, metadata !159, metadata !"times", metadata !1, i32 256, metadata !162, i32 0} ; [ DW_TAG_arg_variable ]
!389 = metadata !{i32 590080, metadata !390, metadata !"dfile", metadata !1, i32 257, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!390 = metadata !{i32 589835, metadata !159, i32 256, i32 0, metadata !1, i32 37} ; [ DW_TAG_lexical_block ]
!391 = metadata !{i32 590080, metadata !390, metadata !"r", metadata !1, i32 269, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!392 = metadata !{i32 590081, metadata !170, metadata !"fd", metadata !1, i32 277, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!393 = metadata !{i32 590081, metadata !170, metadata !"path", metadata !1, i32 277, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!394 = metadata !{i32 590081, metadata !170, metadata !"times", metadata !1, i32 277, metadata !162, i32 0} ; [ DW_TAG_arg_variable ]
!395 = metadata !{i32 590080, metadata !396, metadata !"r", metadata !1, i32 295, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!396 = metadata !{i32 589835, metadata !170, i32 277, i32 0, metadata !1, i32 38} ; [ DW_TAG_lexical_block ]
!397 = metadata !{i32 590080, metadata !398, metadata !"f", metadata !1, i32 279, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!398 = metadata !{i32 589835, metadata !396, i32 279, i32 0, metadata !1, i32 39} ; [ DW_TAG_lexical_block ]
!399 = metadata !{i32 590081, metadata !173, metadata !"pathname", metadata !1, i32 73, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!400 = metadata !{i32 590081, metadata !173, metadata !"mode", metadata !1, i32 73, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!401 = metadata !{i32 590080, metadata !402, metadata !"dfile", metadata !1, i32 74, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!402 = metadata !{i32 589835, metadata !173, i32 73, i32 0, metadata !1, i32 40} ; [ DW_TAG_lexical_block ]
!403 = metadata !{i32 590080, metadata !404, metadata !"r", metadata !1, i32 81, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!404 = metadata !{i32 589835, metadata !402, i32 81, i32 0, metadata !1, i32 41} ; [ DW_TAG_lexical_block ]
!405 = metadata !{i32 590081, metadata !176, metadata !"nfds", metadata !1, i32 1294, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!406 = metadata !{i32 590081, metadata !176, metadata !"read", metadata !1, i32 1294, metadata !179, i32 0} ; [ DW_TAG_arg_variable ]
!407 = metadata !{i32 590081, metadata !176, metadata !"write", metadata !1, i32 1294, metadata !179, i32 0} ; [ DW_TAG_arg_variable ]
!408 = metadata !{i32 590081, metadata !176, metadata !"except", metadata !1, i32 1295, metadata !179, i32 0} ; [ DW_TAG_arg_variable ]
!409 = metadata !{i32 590081, metadata !176, metadata !"timeout", metadata !1, i32 1295, metadata !189, i32 0} ; [ DW_TAG_arg_variable ]
!410 = metadata !{i32 590080, metadata !411, metadata !"in_read", metadata !1, i32 1296, metadata !180, i32 0} ; [ DW_TAG_auto_variable ]
!411 = metadata !{i32 589835, metadata !176, i32 1295, i32 0, metadata !1, i32 42} ; [ DW_TAG_lexical_block ]
!412 = metadata !{i32 590080, metadata !411, metadata !"in_write", metadata !1, i32 1296, metadata !180, i32 0} ; [ DW_TAG_auto_variable ]
!413 = metadata !{i32 590080, metadata !411, metadata !"in_except", metadata !1, i32 1296, metadata !180, i32 0} ; [ DW_TAG_auto_variable ]
!414 = metadata !{i32 590080, metadata !411, metadata !"os_read", metadata !1, i32 1296, metadata !180, i32 0} ; [ DW_TAG_auto_variable ]
!415 = metadata !{i32 590080, metadata !411, metadata !"os_write", metadata !1, i32 1296, metadata !180, i32 0} ; [ DW_TAG_auto_variable ]
!416 = metadata !{i32 590080, metadata !411, metadata !"os_except", metadata !1, i32 1296, metadata !180, i32 0} ; [ DW_TAG_auto_variable ]
!417 = metadata !{i32 590080, metadata !411, metadata !"i", metadata !1, i32 1297, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!418 = metadata !{i32 590080, metadata !411, metadata !"count", metadata !1, i32 1297, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!419 = metadata !{i32 590080, metadata !411, metadata !"os_nfds", metadata !1, i32 1297, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!420 = metadata !{i32 590080, metadata !421, metadata !"f", metadata !1, i32 1327, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!421 = metadata !{i32 589835, metadata !411, i32 1327, i32 0, metadata !1, i32 43} ; [ DW_TAG_lexical_block ]
!422 = metadata !{i32 590080, metadata !423, metadata !"tv", metadata !1, i32 1349, metadata !164, i32 0} ; [ DW_TAG_auto_variable ]
!423 = metadata !{i32 589835, metadata !411, i32 1349, i32 0, metadata !1, i32 44} ; [ DW_TAG_lexical_block ]
!424 = metadata !{i32 590080, metadata !423, metadata !"r", metadata !1, i32 1350, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!425 = metadata !{i32 590080, metadata !426, metadata !"f", metadata !1, i32 1365, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!426 = metadata !{i32 589835, metadata !423, i32 1365, i32 0, metadata !1, i32 45} ; [ DW_TAG_lexical_block ]
!427 = metadata !{i32 590081, metadata !190, metadata !"fd", metadata !1, i32 303, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!428 = metadata !{i32 590080, metadata !429, metadata !"f", metadata !1, i32 305, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!429 = metadata !{i32 589835, metadata !190, i32 303, i32 0, metadata !1, i32 46} ; [ DW_TAG_lexical_block ]
!430 = metadata !{i32 590080, metadata !429, metadata !"r", metadata !1, i32 306, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!431 = metadata !{i32 590081, metadata !191, metadata !"oldfd", metadata !1, i32 1156, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!432 = metadata !{i32 590081, metadata !191, metadata !"newfd", metadata !1, i32 1156, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!433 = metadata !{i32 590080, metadata !434, metadata !"f", metadata !1, i32 1157, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!434 = metadata !{i32 589835, metadata !191, i32 1156, i32 0, metadata !1, i32 47} ; [ DW_TAG_lexical_block ]
!435 = metadata !{i32 590080, metadata !436, metadata !"f2", metadata !1, i32 1163, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!436 = metadata !{i32 589835, metadata !434, i32 1163, i32 0, metadata !1, i32 48} ; [ DW_TAG_lexical_block ]
!437 = metadata !{i32 590081, metadata !194, metadata !"oldfd", metadata !1, i32 1181, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!438 = metadata !{i32 590080, metadata !439, metadata !"f", metadata !1, i32 1182, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!439 = metadata !{i32 589835, metadata !194, i32 1181, i32 0, metadata !1, i32 49} ; [ DW_TAG_lexical_block ]
!440 = metadata !{i32 590080, metadata !441, metadata !"fd", metadata !1, i32 1187, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!441 = metadata !{i32 589835, metadata !439, i32 1188, i32 0, metadata !1, i32 50} ; [ DW_TAG_lexical_block ]
!442 = metadata !{i32 590081, metadata !195, metadata !"pathname", metadata !1, i32 128, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!443 = metadata !{i32 590081, metadata !195, metadata !"flags", metadata !1, i32 128, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!444 = metadata !{i32 590081, metadata !195, metadata !"mode", metadata !1, i32 128, metadata !75, i32 0} ; [ DW_TAG_arg_variable ]
!445 = metadata !{i32 590080, metadata !446, metadata !"df", metadata !1, i32 129, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!446 = metadata !{i32 589835, metadata !195, i32 128, i32 0, metadata !1, i32 51} ; [ DW_TAG_lexical_block ]
!447 = metadata !{i32 590080, metadata !446, metadata !"f", metadata !1, i32 130, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!448 = metadata !{i32 590080, metadata !446, metadata !"fd", metadata !1, i32 131, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!449 = metadata !{i32 590080, metadata !450, metadata !"os_fd", metadata !1, i32 181, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!450 = metadata !{i32 589835, metadata !446, i32 181, i32 0, metadata !1, i32 52} ; [ DW_TAG_lexical_block ]
!451 = metadata !{i32 590081, metadata !198, metadata !"basefd", metadata !1, i32 201, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!452 = metadata !{i32 590081, metadata !198, metadata !"pathname", metadata !1, i32 201, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!453 = metadata !{i32 590081, metadata !198, metadata !"flags", metadata !1, i32 201, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!454 = metadata !{i32 590081, metadata !198, metadata !"mode", metadata !1, i32 201, metadata !75, i32 0} ; [ DW_TAG_arg_variable ]
!455 = metadata !{i32 590080, metadata !456, metadata !"f", metadata !1, i32 202, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!456 = metadata !{i32 589835, metadata !198, i32 201, i32 0, metadata !1, i32 53} ; [ DW_TAG_lexical_block ]
!457 = metadata !{i32 590080, metadata !456, metadata !"fd", metadata !1, i32 203, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!458 = metadata !{i32 590080, metadata !456, metadata !"os_fd", metadata !1, i32 236, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!459 = metadata !{i32 590080, metadata !460, metadata !"bf", metadata !1, i32 205, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!460 = metadata !{i32 589835, metadata !456, i32 205, i32 0, metadata !1, i32 54} ; [ DW_TAG_lexical_block ]
!461 = metadata !{i32 590081, metadata !201, metadata !"fd", metadata !1, i32 1048, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!462 = metadata !{i32 590081, metadata !201, metadata !"cmd", metadata !1, i32 1048, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!463 = metadata !{i32 590080, metadata !464, metadata !"f", metadata !1, i32 1049, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!464 = metadata !{i32 589835, metadata !201, i32 1048, i32 0, metadata !1, i32 55} ; [ DW_TAG_lexical_block ]
!465 = metadata !{i32 590080, metadata !464, metadata !"ap", metadata !1, i32 1050, metadata !466, i32 0} ; [ DW_TAG_auto_variable ]
!466 = metadata !{i32 589846, metadata !467, metadata !"va_list", metadata !467, i32 111, i64 0, i64 0, i64 0, i32 0, metadata !468} ; [ DW_TAG_typedef ]
!467 = metadata !{i32 589865, metadata !"stdio.h", metadata !"/usr/include", metadata !2} ; [ DW_TAG_file_type ]
!468 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 192, i64 64, i64 0, i32 0, metadata !469, metadata !476, i32 0, null} ; [ DW_TAG_array_type ]
!469 = metadata !{i32 589843, metadata !1, metadata !"__va_list_tag", metadata !470, i32 0, i64 192, i64 64, i64 0, i32 0, null, metadata !471, i32 0, null} ; [ DW_TAG_structure_type ]
!470 = metadata !{i32 589865, metadata !"<built-in>", metadata !"/home/qirong/Frog/frog_test/tools/KLEE_SOURCE_2015/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!471 = metadata !{metadata !472, metadata !473, metadata !474, metadata !475}
!472 = metadata !{i32 589837, metadata !469, metadata !"gp_offset", metadata !470, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ]
!473 = metadata !{i32 589837, metadata !469, metadata !"fp_offset", metadata !470, i32 0, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ]
!474 = metadata !{i32 589837, metadata !469, metadata !"overflow_arg_area", metadata !470, i32 0, i64 64, i64 64, i64 64, i32 0, metadata !141} ; [ DW_TAG_member ]
!475 = metadata !{i32 589837, metadata !469, metadata !"reg_save_area", metadata !470, i32 0, i64 64, i64 64, i64 128, i32 0, metadata !141} ; [ DW_TAG_member ]
!476 = metadata !{metadata !477}
!477 = metadata !{i32 589857, i64 0, i64 0}       ; [ DW_TAG_subrange_type ]
!478 = metadata !{i32 590080, metadata !464, metadata !"arg", metadata !1, i32 1051, metadata !11, i32 0} ; [ DW_TAG_auto_variable ]
!479 = metadata !{i32 590080, metadata !480, metadata !"flags", metadata !1, i32 1070, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!480 = metadata !{i32 589835, metadata !464, i32 1070, i32 0, metadata !1, i32 56} ; [ DW_TAG_lexical_block ]
!481 = metadata !{i32 590080, metadata !482, metadata !"r", metadata !1, i32 1096, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!482 = metadata !{i32 589835, metadata !464, i32 1096, i32 0, metadata !1, i32 57} ; [ DW_TAG_lexical_block ]
!483 = metadata !{i32 590081, metadata !202, metadata !"fd", metadata !1, i32 898, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!484 = metadata !{i32 590081, metadata !202, metadata !"request", metadata !1, i32 898, metadata !23, i32 0} ; [ DW_TAG_arg_variable ]
!485 = metadata !{i32 590080, metadata !486, metadata !"f", metadata !1, i32 902, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!486 = metadata !{i32 589835, metadata !202, i32 898, i32 0, metadata !1, i32 58} ; [ DW_TAG_lexical_block ]
!487 = metadata !{i32 590080, metadata !486, metadata !"ap", metadata !1, i32 903, metadata !466, i32 0} ; [ DW_TAG_auto_variable ]
!488 = metadata !{i32 590080, metadata !486, metadata !"buf", metadata !1, i32 904, metadata !141, i32 0} ; [ DW_TAG_auto_variable ]
!489 = metadata !{i32 590080, metadata !490, metadata !"stat", metadata !1, i32 920, metadata !233, i32 0} ; [ DW_TAG_auto_variable ]
!490 = metadata !{i32 589835, metadata !486, i32 920, i32 0, metadata !1, i32 59} ; [ DW_TAG_lexical_block ]
!491 = metadata !{i32 590080, metadata !492, metadata !"ts", metadata !1, i32 924, metadata !493, i32 0} ; [ DW_TAG_auto_variable ]
!492 = metadata !{i32 589835, metadata !490, i32 924, i32 0, metadata !1, i32 60} ; [ DW_TAG_lexical_block ]
!493 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !494} ; [ DW_TAG_pointer_type ]
!494 = metadata !{i32 589843, metadata !1, metadata !"termios", metadata !495, i32 30, i64 480, i64 32, i64 0, i32 0, null, metadata !496, i32 0, null} ; [ DW_TAG_structure_type ]
!495 = metadata !{i32 589865, metadata !"termios.h", metadata !"/usr/include/x86_64-linux-gnu/bits", metadata !2} ; [ DW_TAG_file_type ]
!496 = metadata !{metadata !497, metadata !499, metadata !500, metadata !501, metadata !502, metadata !504, metadata !508, metadata !510}
!497 = metadata !{i32 589837, metadata !494, metadata !"c_iflag", metadata !495, i32 31, i64 32, i64 32, i64 0, i32 0, metadata !498} ; [ DW_TAG_member ]
!498 = metadata !{i32 589846, metadata !495, metadata !"tcflag_t", metadata !495, i32 30, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!499 = metadata !{i32 589837, metadata !494, metadata !"c_oflag", metadata !495, i32 32, i64 32, i64 32, i64 32, i32 0, metadata !498} ; [ DW_TAG_member ]
!500 = metadata !{i32 589837, metadata !494, metadata !"c_cflag", metadata !495, i32 33, i64 32, i64 32, i64 64, i32 0, metadata !498} ; [ DW_TAG_member ]
!501 = metadata !{i32 589837, metadata !494, metadata !"c_lflag", metadata !495, i32 34, i64 32, i64 32, i64 96, i32 0, metadata !498} ; [ DW_TAG_member ]
!502 = metadata !{i32 589837, metadata !494, metadata !"c_line", metadata !495, i32 35, i64 8, i64 8, i64 128, i32 0, metadata !503} ; [ DW_TAG_member ]
!503 = metadata !{i32 589846, metadata !495, metadata !"cc_t", metadata !495, i32 25, i64 0, i64 0, i64 0, i32 0, metadata !218} ; [ DW_TAG_typedef ]
!504 = metadata !{i32 589837, metadata !494, metadata !"c_cc", metadata !495, i32 36, i64 256, i64 8, i64 136, i32 0, metadata !505} ; [ DW_TAG_member ]
!505 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 256, i64 8, i64 0, i32 0, metadata !503, metadata !506, i32 0, null} ; [ DW_TAG_array_type ]
!506 = metadata !{metadata !507}
!507 = metadata !{i32 589857, i64 0, i64 31}      ; [ DW_TAG_subrange_type ]
!508 = metadata !{i32 589837, metadata !494, metadata !"c_ispeed", metadata !495, i32 37, i64 32, i64 32, i64 416, i32 0, metadata !509} ; [ DW_TAG_member ]
!509 = metadata !{i32 589846, metadata !495, metadata !"speed_t", metadata !495, i32 26, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!510 = metadata !{i32 589837, metadata !494, metadata !"c_ospeed", metadata !495, i32 38, i64 32, i64 32, i64 448, i32 0, metadata !509} ; [ DW_TAG_member ]
!511 = metadata !{i32 590080, metadata !512, metadata !"ws", metadata !1, i32 993, metadata !513, i32 0} ; [ DW_TAG_auto_variable ]
!512 = metadata !{i32 589835, metadata !490, i32 993, i32 0, metadata !1, i32 61} ; [ DW_TAG_lexical_block ]
!513 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !514} ; [ DW_TAG_pointer_type ]
!514 = metadata !{i32 589843, metadata !1, metadata !"winsize", metadata !515, i32 29, i64 64, i64 16, i64 0, i32 0, null, metadata !516, i32 0, null} ; [ DW_TAG_structure_type ]
!515 = metadata !{i32 589865, metadata !"ioctl-types.h", metadata !"/usr/include/x86_64-linux-gnu/bits", metadata !2} ; [ DW_TAG_file_type ]
!516 = metadata !{metadata !517, metadata !518, metadata !519, metadata !520}
!517 = metadata !{i32 589837, metadata !514, metadata !"ws_row", metadata !515, i32 30, i64 16, i64 16, i64 0, i32 0, metadata !216} ; [ DW_TAG_member ]
!518 = metadata !{i32 589837, metadata !514, metadata !"ws_col", metadata !515, i32 31, i64 16, i64 16, i64 16, i32 0, metadata !216} ; [ DW_TAG_member ]
!519 = metadata !{i32 589837, metadata !514, metadata !"ws_xpixel", metadata !515, i32 32, i64 16, i64 16, i64 32, i32 0, metadata !216} ; [ DW_TAG_member ]
!520 = metadata !{i32 589837, metadata !514, metadata !"ws_ypixel", metadata !515, i32 33, i64 16, i64 16, i64 48, i32 0, metadata !216} ; [ DW_TAG_member ]
!521 = metadata !{i32 590080, metadata !522, metadata !"res", metadata !1, i32 1016, metadata !523, i32 0} ; [ DW_TAG_auto_variable ]
!522 = metadata !{i32 589835, metadata !490, i32 1016, i32 0, metadata !1, i32 62} ; [ DW_TAG_lexical_block ]
!523 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !35} ; [ DW_TAG_pointer_type ]
!524 = metadata !{i32 590080, metadata !525, metadata !"r", metadata !1, i32 1041, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!525 = metadata !{i32 589835, metadata !486, i32 1041, i32 0, metadata !1, i32 63} ; [ DW_TAG_lexical_block ]
!526 = metadata !{i32 590081, metadata !205, metadata !"fd", metadata !1, i32 814, metadata !11, i32 0} ; [ DW_TAG_arg_variable ]
!527 = metadata !{i32 590081, metadata !205, metadata !"dirp", metadata !1, i32 814, metadata !208, i32 0} ; [ DW_TAG_arg_variable ]
!528 = metadata !{i32 590081, metadata !205, metadata !"count", metadata !1, i32 814, metadata !11, i32 0} ; [ DW_TAG_arg_variable ]
!529 = metadata !{i32 590080, metadata !530, metadata !"f", metadata !1, i32 815, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!530 = metadata !{i32 589835, metadata !205, i32 814, i32 0, metadata !1, i32 64} ; [ DW_TAG_lexical_block ]
!531 = metadata !{i32 590080, metadata !532, metadata !"i", metadata !1, i32 829, metadata !69, i32 0} ; [ DW_TAG_auto_variable ]
!532 = metadata !{i32 589835, metadata !530, i32 829, i32 0, metadata !1, i32 65} ; [ DW_TAG_lexical_block ]
!533 = metadata !{i32 590080, metadata !532, metadata !"pad", metadata !1, i32 829, metadata !69, i32 0} ; [ DW_TAG_auto_variable ]
!534 = metadata !{i32 590080, metadata !532, metadata !"bytes", metadata !1, i32 829, metadata !69, i32 0} ; [ DW_TAG_auto_variable ]
!535 = metadata !{i32 590080, metadata !536, metadata !"df", metadata !1, i32 839, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!536 = metadata !{i32 589835, metadata !532, i32 839, i32 0, metadata !1, i32 66} ; [ DW_TAG_lexical_block ]
!537 = metadata !{i32 590080, metadata !538, metadata !"os_pos", metadata !1, i32 862, metadata !69, i32 0} ; [ DW_TAG_auto_variable ]
!538 = metadata !{i32 589835, metadata !530, i32 862, i32 0, metadata !1, i32 67} ; [ DW_TAG_lexical_block ]
!539 = metadata !{i32 590080, metadata !538, metadata !"res", metadata !1, i32 863, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!540 = metadata !{i32 590080, metadata !538, metadata !"s", metadata !1, i32 864, metadata !69, i32 0} ; [ DW_TAG_auto_variable ]
!541 = metadata !{i32 590080, metadata !542, metadata !"pos", metadata !1, i32 880, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!542 = metadata !{i32 589835, metadata !538, i32 880, i32 0, metadata !1, i32 68} ; [ DW_TAG_lexical_block ]
!543 = metadata !{i32 590080, metadata !544, metadata !"dp", metadata !1, i32 886, metadata !208, i32 0} ; [ DW_TAG_auto_variable ]
!544 = metadata !{i32 589835, metadata !542, i32 886, i32 0, metadata !1, i32 69} ; [ DW_TAG_lexical_block ]
!545 = metadata !{i32 590081, metadata !223, metadata !"fd", metadata !1, i32 475, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!546 = metadata !{i32 590081, metadata !223, metadata !"offset", metadata !1, i32 475, metadata !69, i32 0} ; [ DW_TAG_arg_variable ]
!547 = metadata !{i32 590081, metadata !223, metadata !"whence", metadata !1, i32 475, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!548 = metadata !{i32 590080, metadata !549, metadata !"new_off", metadata !1, i32 476, metadata !69, i32 0} ; [ DW_TAG_auto_variable ]
!549 = metadata !{i32 589835, metadata !223, i32 475, i32 0, metadata !1, i32 70} ; [ DW_TAG_lexical_block ]
!550 = metadata !{i32 590080, metadata !549, metadata !"f", metadata !1, i32 477, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!551 = metadata !{i32 590081, metadata !226, metadata !"fd", metadata !1, i32 758, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!552 = metadata !{i32 590081, metadata !226, metadata !"buf", metadata !1, i32 758, metadata !16, i32 0} ; [ DW_TAG_arg_variable ]
!553 = metadata !{i32 590080, metadata !554, metadata !"f", metadata !1, i32 759, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!554 = metadata !{i32 589835, metadata !226, i32 758, i32 0, metadata !1, i32 71} ; [ DW_TAG_lexical_block ]
!555 = metadata !{i32 590080, metadata !556, metadata !"r", metadata !1, i32 768, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!556 = metadata !{i32 589835, metadata !554, i32 768, i32 0, metadata !1, i32 72} ; [ DW_TAG_lexical_block ]
!557 = metadata !{i32 590081, metadata !227, metadata !"path", metadata !1, i32 587, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!558 = metadata !{i32 590081, metadata !227, metadata !"buf", metadata !1, i32 587, metadata !16, i32 0} ; [ DW_TAG_arg_variable ]
!559 = metadata !{i32 590080, metadata !560, metadata !"dfile", metadata !1, i32 588, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!560 = metadata !{i32 589835, metadata !227, i32 587, i32 0, metadata !1, i32 73} ; [ DW_TAG_lexical_block ]
!561 = metadata !{i32 590080, metadata !562, metadata !"r", metadata !1, i32 596, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!562 = metadata !{i32 589835, metadata !560, i32 596, i32 0, metadata !1, i32 74} ; [ DW_TAG_lexical_block ]
!563 = metadata !{i32 590081, metadata !230, metadata !"fd", metadata !1, i32 551, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!564 = metadata !{i32 590081, metadata !230, metadata !"path", metadata !1, i32 551, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!565 = metadata !{i32 590081, metadata !230, metadata !"buf", metadata !1, i32 551, metadata !233, i32 0} ; [ DW_TAG_arg_variable ]
!566 = metadata !{i32 590081, metadata !230, metadata !"flags", metadata !1, i32 551, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!567 = metadata !{i32 590080, metadata !568, metadata !"dfile", metadata !1, i32 565, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!568 = metadata !{i32 589835, metadata !230, i32 551, i32 0, metadata !1, i32 75} ; [ DW_TAG_lexical_block ]
!569 = metadata !{i32 590080, metadata !568, metadata !"r", metadata !1, i32 572, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!570 = metadata !{i32 590080, metadata !571, metadata !"f", metadata !1, i32 553, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!571 = metadata !{i32 589835, metadata !568, i32 553, i32 0, metadata !1, i32 76} ; [ DW_TAG_lexical_block ]
!572 = metadata !{i32 590081, metadata !253, metadata !"path", metadata !1, i32 532, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!573 = metadata !{i32 590081, metadata !253, metadata !"buf", metadata !1, i32 532, metadata !16, i32 0} ; [ DW_TAG_arg_variable ]
!574 = metadata !{i32 590080, metadata !575, metadata !"dfile", metadata !1, i32 533, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!575 = metadata !{i32 589835, metadata !253, i32 532, i32 0, metadata !1, i32 77} ; [ DW_TAG_lexical_block ]
!576 = metadata !{i32 590080, metadata !577, metadata !"r", metadata !1, i32 541, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!577 = metadata !{i32 589835, metadata !575, i32 541, i32 0, metadata !1, i32 78} ; [ DW_TAG_lexical_block ]
!578 = metadata !{i32 590081, metadata !254, metadata !"fd", metadata !1, i32 403, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!579 = metadata !{i32 590081, metadata !254, metadata !"buf", metadata !1, i32 403, metadata !141, i32 0} ; [ DW_TAG_arg_variable ]
!580 = metadata !{i32 590081, metadata !254, metadata !"count", metadata !1, i32 403, metadata !96, i32 0} ; [ DW_TAG_arg_variable ]
!581 = metadata !{i32 590080, metadata !582, metadata !"f", metadata !1, i32 405, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!582 = metadata !{i32 589835, metadata !254, i32 403, i32 0, metadata !1, i32 79} ; [ DW_TAG_lexical_block ]
!583 = metadata !{i32 590080, metadata !584, metadata !"r", metadata !1, i32 423, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!584 = metadata !{i32 589835, metadata !582, i32 425, i32 0, metadata !1, i32 80} ; [ DW_TAG_lexical_block ]
!585 = metadata !{i32 590080, metadata !586, metadata !"actual_count", metadata !1, i32 448, metadata !96, i32 0} ; [ DW_TAG_auto_variable ]
!586 = metadata !{i32 589835, metadata !582, i32 448, i32 0, metadata !1, i32 81} ; [ DW_TAG_lexical_block ]
!587 = metadata !{i32 590081, metadata !257, metadata !"fd", metadata !1, i32 335, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!588 = metadata !{i32 590081, metadata !257, metadata !"buf", metadata !1, i32 335, metadata !141, i32 0} ; [ DW_TAG_arg_variable ]
!589 = metadata !{i32 590081, metadata !257, metadata !"count", metadata !1, i32 335, metadata !96, i32 0} ; [ DW_TAG_arg_variable ]
!590 = metadata !{i32 590080, metadata !591, metadata !"f", metadata !1, i32 337, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!591 = metadata !{i32 589835, metadata !257, i32 335, i32 0, metadata !1, i32 82} ; [ DW_TAG_lexical_block ]
!592 = metadata !{i32 590080, metadata !593, metadata !"r", metadata !1, i32 364, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!593 = metadata !{i32 589835, metadata !591, i32 365, i32 0, metadata !1, i32 83} ; [ DW_TAG_lexical_block ]
!594 = metadata !{i32 590081, metadata !258, metadata !"df", metadata !1, i32 645, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!595 = metadata !{i32 590081, metadata !258, metadata !"mode", metadata !1, i32 645, metadata !75, i32 0} ; [ DW_TAG_arg_variable ]
!596 = metadata !{i32 590081, metadata !261, metadata !"fd", metadata !1, i32 680, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!597 = metadata !{i32 590081, metadata !261, metadata !"mode", metadata !1, i32 680, metadata !75, i32 0} ; [ DW_TAG_arg_variable ]
!598 = metadata !{i32 590080, metadata !599, metadata !"f", metadata !1, i32 683, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!599 = metadata !{i32 589835, metadata !261, i32 680, i32 0, metadata !1, i32 85} ; [ DW_TAG_lexical_block ]
!600 = metadata !{i32 590080, metadata !601, metadata !"r", metadata !1, i32 700, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!601 = metadata !{i32 589835, metadata !599, i32 700, i32 0, metadata !1, i32 86} ; [ DW_TAG_lexical_block ]
!602 = metadata !{i32 590081, metadata !264, metadata !"path", metadata !1, i32 658, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!603 = metadata !{i32 590081, metadata !264, metadata !"mode", metadata !1, i32 658, metadata !75, i32 0} ; [ DW_TAG_arg_variable ]
!604 = metadata !{i32 590080, metadata !605, metadata !"dfile", metadata !1, i32 661, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!605 = metadata !{i32 589835, metadata !264, i32 658, i32 0, metadata !1, i32 87} ; [ DW_TAG_lexical_block ]
!606 = metadata !{i32 590080, metadata !607, metadata !"r", metadata !1, i32 673, metadata !35, i32 0} ; [ DW_TAG_auto_variable ]
!607 = metadata !{i32 589835, metadata !605, i32 673, i32 0, metadata !1, i32 88} ; [ DW_TAG_lexical_block ]
!608 = metadata !{i32 73, i32 0, metadata !173, null}
!609 = metadata !{i32 39, i32 0, metadata !0, metadata !610}
!610 = metadata !{i32 74, i32 0, metadata !402, null}
!611 = metadata !{i32 40, i32 0, metadata !269, metadata !610}
!612 = metadata !{i32 43, i32 0, metadata !269, metadata !610}
!613 = metadata !{i32 46, i32 0, metadata !269, metadata !610}
!614 = metadata !{i32 47, i32 0, metadata !269, metadata !610}
!615 = metadata !{i32 48, i32 0, metadata !272, metadata !610}
!616 = metadata !{null}
!617 = metadata !{i32 49, i32 0, metadata !272, metadata !610}
!618 = metadata !{i32 76, i32 0, metadata !402, null}
!619 = metadata !{i32 1428, i32 0, metadata !148, metadata !620}
!620 = metadata !{i32 81, i32 0, metadata !404, null}
!621 = metadata !{i32 1415, i32 0, metadata !138, metadata !622}
!622 = metadata !{i32 1429, i32 0, metadata !356, metadata !620}
!623 = metadata !{i32 1417, i32 0, metadata !346, metadata !622}
!624 = metadata !{i32 1418, i32 0, metadata !346, metadata !622}
!625 = metadata !{i32 0}
!626 = metadata !{i32 1432, i32 0, metadata !356, metadata !620}
!627 = metadata !{i32 1433, i32 0, metadata !359, metadata !620}
!628 = metadata !{i32 1434, i32 0, metadata !359, metadata !620}
!629 = metadata !{i32 1436, i32 0, metadata !359, metadata !620}
!630 = metadata !{i32 1439, i32 0, metadata !359, metadata !620}
!631 = metadata !{i32 1442, i32 0, metadata !361, metadata !620}
!632 = metadata !{i32 1443, i32 0, metadata !361, metadata !620}
!633 = metadata !{i32 1444, i32 0, metadata !361, metadata !620}
!634 = metadata !{i32 1445, i32 0, metadata !361, metadata !620}
!635 = metadata !{i32 82, i32 0, metadata !404, null}
!636 = metadata !{i32 83, i32 0, metadata !404, null}
!637 = metadata !{i32 79, i32 0, metadata !402, null}
!638 = metadata !{i32 88, i32 0, metadata !72, null}
!639 = metadata !{i32 89, i32 0, metadata !279, null}
!640 = metadata !{i32 90, i32 0, metadata !279, null}
!641 = metadata !{i32 91, i32 0, metadata !279, null}
!642 = metadata !{i32 1457, i32 0, metadata !79, null}
!643 = metadata !{i32 1458, i32 0, metadata !644, null}
!644 = metadata !{i32 589835, metadata !79, i32 1457, i32 0, metadata !1, i32 6} ; [ DW_TAG_lexical_block ]
!645 = metadata !{i32 1459, i32 0, metadata !644, null}
!646 = metadata !{i32 1460, i32 0, metadata !644, null}
!647 = metadata !{i32 1463, i32 0, metadata !644, null}
!648 = metadata !{i32 1467, i32 0, metadata !644, null}
!649 = metadata !{i32 1468, i32 0, metadata !644, null}
!650 = metadata !{i32 1469, i32 0, metadata !644, null}
!651 = metadata !{i32 1239, i32 0, metadata !82, null}
!652 = metadata !{i32 39, i32 0, metadata !0, metadata !653}
!653 = metadata !{i32 1242, i32 0, metadata !291, null}
!654 = metadata !{i32 40, i32 0, metadata !269, metadata !653}
!655 = metadata !{i32 43, i32 0, metadata !269, metadata !653}
!656 = metadata !{i32 46, i32 0, metadata !269, metadata !653}
!657 = metadata !{i32 47, i32 0, metadata !269, metadata !653}
!658 = metadata !{i32 48, i32 0, metadata !272, metadata !653}
!659 = metadata !{i32 49, i32 0, metadata !272, metadata !653}
!660 = metadata !{i32 1243, i32 0, metadata !291, null}
!661 = metadata !{i32 1245, i32 0, metadata !291, null}
!662 = metadata !{i32 1246, i32 0, metadata !291, null}
!663 = metadata !{i32 1247, i32 0, metadata !291, null}
!664 = metadata !{i32 1248, i32 0, metadata !291, null}
!665 = metadata !{i32 1249, i32 0, metadata !291, null}
!666 = metadata !{i32 1250, i32 0, metadata !291, null}
!667 = metadata !{i32 1252, i32 0, metadata !291, null}
!668 = metadata !{i32 1253, i32 0, metadata !291, null}
!669 = metadata !{i32 1257, i32 0, metadata !291, null}
!670 = metadata !{i32 1258, i32 0, metadata !291, null}
!671 = metadata !{i32 1259, i32 0, metadata !291, null}
!672 = metadata !{i32 1218, i32 0, metadata !85, null}
!673 = metadata !{i32 39, i32 0, metadata !0, metadata !674}
!674 = metadata !{i32 1219, i32 0, metadata !294, null}
!675 = metadata !{i32 40, i32 0, metadata !269, metadata !674}
!676 = metadata !{i32 43, i32 0, metadata !269, metadata !674}
!677 = metadata !{i32 46, i32 0, metadata !269, metadata !674}
!678 = metadata !{i32 47, i32 0, metadata !269, metadata !674}
!679 = metadata !{i32 48, i32 0, metadata !272, metadata !674}
!680 = metadata !{i32 49, i32 0, metadata !272, metadata !674}
!681 = metadata !{i32 1220, i32 0, metadata !294, null}
!682 = metadata !{i32 1222, i32 0, metadata !294, null}
!683 = metadata !{i32 1223, i32 0, metadata !294, null}
!684 = metadata !{i32 1224, i32 0, metadata !294, null}
!685 = metadata !{i32 1225, i32 0, metadata !294, null}
!686 = metadata !{i32 1226, i32 0, metadata !294, null}
!687 = metadata !{i32 1227, i32 0, metadata !294, null}
!688 = metadata !{i32 1229, i32 0, metadata !294, null}
!689 = metadata !{i32 1230, i32 0, metadata !294, null}
!690 = metadata !{i32 1234, i32 0, metadata !294, null}
!691 = metadata !{i32 1235, i32 0, metadata !294, null}
!692 = metadata !{i32 1236, i32 0, metadata !294, null}
!693 = metadata !{i32 1200, i32 0, metadata !86, null}
!694 = metadata !{i32 39, i32 0, metadata !0, metadata !695}
!695 = metadata !{i32 1201, i32 0, metadata !297, null}
!696 = metadata !{i32 40, i32 0, metadata !269, metadata !695}
!697 = metadata !{i32 43, i32 0, metadata !269, metadata !695}
!698 = metadata !{i32 46, i32 0, metadata !269, metadata !695}
!699 = metadata !{i32 47, i32 0, metadata !269, metadata !695}
!700 = metadata !{i32 48, i32 0, metadata !272, metadata !695}
!701 = metadata !{i32 49, i32 0, metadata !272, metadata !695}
!702 = metadata !{i32 1202, i32 0, metadata !297, null}
!703 = metadata !{i32 1204, i32 0, metadata !297, null}
!704 = metadata !{i32 1205, i32 0, metadata !297, null}
!705 = metadata !{i32 1206, i32 0, metadata !297, null}
!706 = metadata !{i32 1208, i32 0, metadata !297, null}
!707 = metadata !{i32 1209, i32 0, metadata !297, null}
!708 = metadata !{i32 1213, i32 0, metadata !297, null}
!709 = metadata !{i32 1214, i32 0, metadata !297, null}
!710 = metadata !{i32 1215, i32 0, metadata !297, null}
!711 = metadata !{i32 1262, i32 0, metadata !92, null}
!712 = metadata !{i32 39, i32 0, metadata !0, metadata !713}
!713 = metadata !{i32 1263, i32 0, metadata !305, null}
!714 = metadata !{i32 40, i32 0, metadata !269, metadata !713}
!715 = metadata !{i32 43, i32 0, metadata !269, metadata !713}
!716 = metadata !{i32 46, i32 0, metadata !269, metadata !713}
!717 = metadata !{i32 47, i32 0, metadata !269, metadata !713}
!718 = metadata !{i32 48, i32 0, metadata !272, metadata !713}
!719 = metadata !{i32 49, i32 0, metadata !272, metadata !713}
!720 = metadata !{i32 1264, i32 0, metadata !305, null}
!721 = metadata !{i32 1267, i32 0, metadata !305, null}
!722 = metadata !{i32 1268, i32 0, metadata !305, null}
!723 = metadata !{i32 1269, i32 0, metadata !305, null}
!724 = metadata !{i32 1270, i32 0, metadata !305, null}
!725 = metadata !{i32 1271, i32 0, metadata !305, null}
!726 = metadata !{i32 1272, i32 0, metadata !305, null}
!727 = metadata !{i32 1273, i32 0, metadata !305, null}
!728 = metadata !{i32 1275, i32 0, metadata !305, null}
!729 = metadata !{i32 1276, i32 0, metadata !305, null}
!730 = metadata !{i32 1279, i32 0, metadata !307, null}
!731 = metadata !{i32 1280, i32 0, metadata !307, null}
!732 = metadata !{i32 1281, i32 0, metadata !307, null}
!733 = metadata !{i32 1282, i32 0, metadata !307, null}
!734 = metadata !{i32 1140, i32 0, metadata !97, null}
!735 = metadata !{i32 63, i32 0, metadata !59, metadata !736}
!736 = metadata !{i32 1141, i32 0, metadata !310, null}
!737 = metadata !{i32 64, i32 0, metadata !276, metadata !736}
!738 = metadata !{i32 65, i32 0, metadata !275, metadata !736}
!739 = metadata !{i32 66, i32 0, metadata !275, metadata !736}
!740 = metadata !{i32 1143, i32 0, metadata !310, null}
!741 = metadata !{i32 1144, i32 0, metadata !310, null}
!742 = metadata !{i32 1145, i32 0, metadata !310, null}
!743 = metadata !{i32 1146, i32 0, metadata !310, null}
!744 = metadata !{i32 1149, i32 0, metadata !312, null}
!745 = metadata !{i32 1150, i32 0, metadata !312, null}
!746 = metadata !{i32 1151, i32 0, metadata !312, null}
!747 = metadata !{i32 1120, i32 0, metadata !100, null}
!748 = metadata !{i32 63, i32 0, metadata !59, metadata !749}
!749 = metadata !{i32 1121, i32 0, metadata !316, null}
!750 = metadata !{i32 64, i32 0, metadata !276, metadata !749}
!751 = metadata !{i32 65, i32 0, metadata !275, metadata !749}
!752 = metadata !{i32 66, i32 0, metadata !275, metadata !749}
!753 = metadata !{i32 1123, i32 0, metadata !316, null}
!754 = metadata !{i32 1124, i32 0, metadata !316, null}
!755 = metadata !{i32 1125, i32 0, metadata !316, null}
!756 = metadata !{i32 1128, i32 0, metadata !316, null}
!757 = metadata !{i32 1129, i32 0, metadata !316, null}
!758 = metadata !{i32 1130, i32 0, metadata !316, null}
!759 = metadata !{i32 1131, i32 0, metadata !316, null}
!760 = metadata !{i32 1133, i32 0, metadata !318, null}
!761 = metadata !{i32 1134, i32 0, metadata !318, null}
!762 = metadata !{i32 1135, i32 0, metadata !318, null}
!763 = metadata !{i32 781, i32 0, metadata !131, null}
!764 = metadata !{i32 63, i32 0, metadata !59, metadata !765}
!765 = metadata !{i32 783, i32 0, metadata !322, null}
!766 = metadata !{i32 64, i32 0, metadata !276, metadata !765}
!767 = metadata !{i32 65, i32 0, metadata !275, metadata !765}
!768 = metadata !{i32 66, i32 0, metadata !275, metadata !765}
!769 = metadata !{i32 785, i32 0, metadata !322, null}
!770 = metadata !{i32 787, i32 0, metadata !322, null}
!771 = metadata !{i32 788, i32 0, metadata !322, null}
!772 = metadata !{i32 789, i32 0, metadata !322, null}
!773 = metadata !{i32 792, i32 0, metadata !322, null}
!774 = metadata !{i32 793, i32 0, metadata !322, null}
!775 = metadata !{i32 794, i32 0, metadata !322, null}
!776 = metadata !{i32 795, i32 0, metadata !322, null}
!777 = metadata !{i32 798, i32 0, metadata !322, null}
!778 = metadata !{i32 799, i32 0, metadata !322, null}
!779 = metadata !{i32 800, i32 0, metadata !322, null}
!780 = metadata !{i32 801, i32 0, metadata !322, null}
!781 = metadata !{i32 804, i32 0, metadata !324, null}
!782 = metadata !{i32 808, i32 0, metadata !324, null}
!783 = metadata !{i32 809, i32 0, metadata !324, null}
!784 = metadata !{i32 726, i32 0, metadata !134, null}
!785 = metadata !{i32 63, i32 0, metadata !59, metadata !786}
!786 = metadata !{i32 727, i32 0, metadata !336, null}
!787 = metadata !{i32 64, i32 0, metadata !276, metadata !786}
!788 = metadata !{i32 65, i32 0, metadata !275, metadata !786}
!789 = metadata !{i32 66, i32 0, metadata !275, metadata !786}
!790 = metadata !{i32 729, i32 0, metadata !336, null}
!791 = metadata !{i32 730, i32 0, metadata !336, null}
!792 = metadata !{i32 731, i32 0, metadata !336, null}
!793 = metadata !{i32 734, i32 0, metadata !336, null}
!794 = metadata !{%struct.exe_disk_file_t* null}
!795 = metadata !{i32 707, i32 0, metadata !87, metadata !796}
!796 = metadata !{i32 735, i32 0, metadata !336, null}
!797 = metadata !{i32 708, i32 0, metadata !798, metadata !796}
!798 = metadata !{i32 589835, metadata !87, i32 707, i32 0, metadata !1, i32 10} ; [ DW_TAG_lexical_block ]
!799 = metadata !{i32 709, i32 0, metadata !798, metadata !796}
!800 = metadata !{i32 737, i32 0, metadata !338, null}
!801 = metadata !{i32 738, i32 0, metadata !338, null}
!802 = metadata !{i32 739, i32 0, metadata !338, null}
!803 = metadata !{i32 624, i32 0, metadata !137, null}
!804 = metadata !{i32 63, i32 0, metadata !59, metadata !805}
!805 = metadata !{i32 625, i32 0, metadata !341, null}
!806 = metadata !{i32 64, i32 0, metadata !276, metadata !805}
!807 = metadata !{i32 65, i32 0, metadata !275, metadata !805}
!808 = metadata !{i32 66, i32 0, metadata !275, metadata !805}
!809 = metadata !{i32 627, i32 0, metadata !341, null}
!810 = metadata !{i32 628, i32 0, metadata !341, null}
!811 = metadata !{i32 629, i32 0, metadata !341, null}
!812 = metadata !{i32 632, i32 0, metadata !341, null}
!813 = metadata !{i32 633, i32 0, metadata !341, null}
!814 = metadata !{i32 634, i32 0, metadata !341, null}
!815 = metadata !{i32 635, i32 0, metadata !341, null}
!816 = metadata !{i32 637, i32 0, metadata !343, null}
!817 = metadata !{i32 638, i32 0, metadata !343, null}
!818 = metadata !{i32 639, i32 0, metadata !343, null}
!819 = metadata !{i32 1380, i32 0, metadata !145, null}
!820 = metadata !{i32 1384, i32 0, metadata !353, null}
!821 = metadata !{i32 1386, i32 0, metadata !353, null}
!822 = metadata !{i32 1387, i32 0, metadata !353, null}
!823 = metadata !{i32 1388, i32 0, metadata !353, null}
!824 = metadata !{i32 1389, i32 0, metadata !353, null}
!825 = metadata !{i32 1392, i32 0, metadata !353, null}
!826 = metadata !{i32 1393, i32 0, metadata !353, null}
!827 = metadata !{i64 1024}
!828 = metadata !{i32 1394, i32 0, metadata !353, null}
!829 = metadata !{i32 1395, i32 0, metadata !353, null}
!830 = metadata !{i32 1415, i32 0, metadata !138, metadata !831}
!831 = metadata !{i32 1398, i32 0, metadata !353, null}
!832 = metadata !{i32 1417, i32 0, metadata !346, metadata !831}
!833 = metadata !{i32 1418, i32 0, metadata !346, metadata !831}
!834 = metadata !{i32 1422, i32 0, metadata !142, metadata !835}
!835 = metadata !{i32 1399, i32 0, metadata !353, null}
!836 = metadata !{i32 1423, i32 0, metadata !349, metadata !835}
!837 = metadata !{i32 1424, i32 0, metadata !349, metadata !835}
!838 = metadata !{i32 1403, i32 0, metadata !353, null}
!839 = metadata !{i32 1404, i32 0, metadata !353, null}
!840 = metadata !{i32 1405, i32 0, metadata !353, null}
!841 = metadata !{i32 1406, i32 0, metadata !353, null}
!842 = metadata !{i32 1407, i32 0, metadata !353, null}
!843 = metadata !{i32 1103, i32 0, metadata !151, null}
!844 = metadata !{i32 39, i32 0, metadata !0, metadata !845}
!845 = metadata !{i32 1104, i32 0, metadata !365, null}
!846 = metadata !{i32 40, i32 0, metadata !269, metadata !845}
!847 = metadata !{i32 43, i32 0, metadata !269, metadata !845}
!848 = metadata !{i32 46, i32 0, metadata !269, metadata !845}
!849 = metadata !{i32 47, i32 0, metadata !269, metadata !845}
!850 = metadata !{i32 48, i32 0, metadata !272, metadata !845}
!851 = metadata !{i32 49, i32 0, metadata !272, metadata !845}
!852 = metadata !{i32 1105, i32 0, metadata !365, null}
!853 = metadata !{i32 1107, i32 0, metadata !365, null}
!854 = metadata !{i32 1108, i32 0, metadata !365, null}
!855 = metadata !{i32 1109, i32 0, metadata !365, null}
!856 = metadata !{i32 1428, i32 0, metadata !148, metadata !857}
!857 = metadata !{i32 1113, i32 0, metadata !367, null}
!858 = metadata !{i32 1415, i32 0, metadata !138, metadata !859}
!859 = metadata !{i32 1429, i32 0, metadata !356, metadata !857}
!860 = metadata !{i32 1417, i32 0, metadata !346, metadata !859}
!861 = metadata !{i32 1418, i32 0, metadata !346, metadata !859}
!862 = metadata !{i32 1432, i32 0, metadata !356, metadata !857}
!863 = metadata !{i32 1433, i32 0, metadata !359, metadata !857}
!864 = metadata !{i32 1434, i32 0, metadata !359, metadata !857}
!865 = metadata !{i32 1436, i32 0, metadata !359, metadata !857}
!866 = metadata !{i32 1439, i32 0, metadata !359, metadata !857}
!867 = metadata !{i32 1442, i32 0, metadata !361, metadata !857}
!868 = metadata !{i32 1443, i32 0, metadata !361, metadata !857}
!869 = metadata !{i32 1444, i32 0, metadata !361, metadata !857}
!870 = metadata !{i32 1445, i32 0, metadata !361, metadata !857}
!871 = metadata !{i32 1114, i32 0, metadata !367, null}
!872 = metadata !{i32 1115, i32 0, metadata !367, null}
!873 = metadata !{i32 744, i32 0, metadata !154, null}
!874 = metadata !{i32 39, i32 0, metadata !0, metadata !875}
!875 = metadata !{i32 746, i32 0, metadata !372, null}
!876 = metadata !{i32 40, i32 0, metadata !269, metadata !875}
!877 = metadata !{i32 43, i32 0, metadata !269, metadata !875}
!878 = metadata !{i32 46, i32 0, metadata !269, metadata !875}
!879 = metadata !{i32 47, i32 0, metadata !269, metadata !875}
!880 = metadata !{i32 48, i32 0, metadata !272, metadata !875}
!881 = metadata !{i32 49, i32 0, metadata !272, metadata !875}
!882 = metadata !{i32 748, i32 0, metadata !372, null}
!883 = metadata !{i32 707, i32 0, metadata !87, metadata !884}
!884 = metadata !{i32 749, i32 0, metadata !372, null}
!885 = metadata !{i32 708, i32 0, metadata !798, metadata !884}
!886 = metadata !{i32 709, i32 0, metadata !798, metadata !884}
!887 = metadata !{i32 1428, i32 0, metadata !148, metadata !888}
!888 = metadata !{i32 751, i32 0, metadata !374, null}
!889 = metadata !{i32 1415, i32 0, metadata !138, metadata !890}
!890 = metadata !{i32 1429, i32 0, metadata !356, metadata !888}
!891 = metadata !{i32 1417, i32 0, metadata !346, metadata !890}
!892 = metadata !{i32 1418, i32 0, metadata !346, metadata !890}
!893 = metadata !{i32 1432, i32 0, metadata !356, metadata !888}
!894 = metadata !{i32 1433, i32 0, metadata !359, metadata !888}
!895 = metadata !{i32 1434, i32 0, metadata !359, metadata !888}
!896 = metadata !{i32 1436, i32 0, metadata !359, metadata !888}
!897 = metadata !{i32 1439, i32 0, metadata !359, metadata !888}
!898 = metadata !{i32 1442, i32 0, metadata !361, metadata !888}
!899 = metadata !{i32 1443, i32 0, metadata !361, metadata !888}
!900 = metadata !{i32 1444, i32 0, metadata !361, metadata !888}
!901 = metadata !{i32 1445, i32 0, metadata !361, metadata !888}
!902 = metadata !{i32 752, i32 0, metadata !374, null}
!903 = metadata !{i32 753, i32 0, metadata !374, null}
!904 = metadata !{i32 713, i32 0, metadata !157, null}
!905 = metadata !{i32 39, i32 0, metadata !0, metadata !906}
!906 = metadata !{i32 714, i32 0, metadata !379, null}
!907 = metadata !{i32 40, i32 0, metadata !269, metadata !906}
!908 = metadata !{i32 43, i32 0, metadata !269, metadata !906}
!909 = metadata !{i32 46, i32 0, metadata !269, metadata !906}
!910 = metadata !{i32 47, i32 0, metadata !269, metadata !906}
!911 = metadata !{i32 48, i32 0, metadata !272, metadata !906}
!912 = metadata !{i32 49, i32 0, metadata !272, metadata !906}
!913 = metadata !{i32 716, i32 0, metadata !379, null}
!914 = metadata !{i32 707, i32 0, metadata !87, metadata !915}
!915 = metadata !{i32 717, i32 0, metadata !379, null}
!916 = metadata !{i32 708, i32 0, metadata !798, metadata !915}
!917 = metadata !{i32 709, i32 0, metadata !798, metadata !915}
!918 = metadata !{i32 1428, i32 0, metadata !148, metadata !919}
!919 = metadata !{i32 719, i32 0, metadata !381, null}
!920 = metadata !{i32 1415, i32 0, metadata !138, metadata !921}
!921 = metadata !{i32 1429, i32 0, metadata !356, metadata !919}
!922 = metadata !{i32 1417, i32 0, metadata !346, metadata !921}
!923 = metadata !{i32 1418, i32 0, metadata !346, metadata !921}
!924 = metadata !{i32 1432, i32 0, metadata !356, metadata !919}
!925 = metadata !{i32 1433, i32 0, metadata !359, metadata !919}
!926 = metadata !{i32 1434, i32 0, metadata !359, metadata !919}
!927 = metadata !{i32 1436, i32 0, metadata !359, metadata !919}
!928 = metadata !{i32 1439, i32 0, metadata !359, metadata !919}
!929 = metadata !{i32 1442, i32 0, metadata !361, metadata !919}
!930 = metadata !{i32 1443, i32 0, metadata !361, metadata !919}
!931 = metadata !{i32 1444, i32 0, metadata !361, metadata !919}
!932 = metadata !{i32 1445, i32 0, metadata !361, metadata !919}
!933 = metadata !{i32 720, i32 0, metadata !381, null}
!934 = metadata !{i32 721, i32 0, metadata !381, null}
!935 = metadata !{i32 606, i32 0, metadata !158, null}
!936 = metadata !{i32 39, i32 0, metadata !0, metadata !937}
!937 = metadata !{i32 607, i32 0, metadata !384, null}
!938 = metadata !{i32 40, i32 0, metadata !269, metadata !937}
!939 = metadata !{i32 43, i32 0, metadata !269, metadata !937}
!940 = metadata !{i32 46, i32 0, metadata !269, metadata !937}
!941 = metadata !{i32 47, i32 0, metadata !269, metadata !937}
!942 = metadata !{i32 48, i32 0, metadata !272, metadata !937}
!943 = metadata !{i32 49, i32 0, metadata !272, metadata !937}
!944 = metadata !{i32 609, i32 0, metadata !384, null}
!945 = metadata !{i32 611, i32 0, metadata !384, null}
!946 = metadata !{i32 612, i32 0, metadata !384, null}
!947 = metadata !{i32 613, i32 0, metadata !384, null}
!948 = metadata !{i32 1428, i32 0, metadata !148, metadata !949}
!949 = metadata !{i32 617, i32 0, metadata !386, null}
!950 = metadata !{i32 1415, i32 0, metadata !138, metadata !951}
!951 = metadata !{i32 1429, i32 0, metadata !356, metadata !949}
!952 = metadata !{i32 1417, i32 0, metadata !346, metadata !951}
!953 = metadata !{i32 1418, i32 0, metadata !346, metadata !951}
!954 = metadata !{i32 1432, i32 0, metadata !356, metadata !949}
!955 = metadata !{i32 1433, i32 0, metadata !359, metadata !949}
!956 = metadata !{i32 1434, i32 0, metadata !359, metadata !949}
!957 = metadata !{i32 1436, i32 0, metadata !359, metadata !949}
!958 = metadata !{i32 1439, i32 0, metadata !359, metadata !949}
!959 = metadata !{i32 1442, i32 0, metadata !361, metadata !949}
!960 = metadata !{i32 1443, i32 0, metadata !361, metadata !949}
!961 = metadata !{i32 1444, i32 0, metadata !361, metadata !949}
!962 = metadata !{i32 1445, i32 0, metadata !361, metadata !949}
!963 = metadata !{i32 618, i32 0, metadata !386, null}
!964 = metadata !{i32 619, i32 0, metadata !386, null}
!965 = metadata !{i32 256, i32 0, metadata !159, null}
!966 = metadata !{i32 39, i32 0, metadata !0, metadata !967}
!967 = metadata !{i32 257, i32 0, metadata !390, null}
!968 = metadata !{i32 40, i32 0, metadata !269, metadata !967}
!969 = metadata !{i32 43, i32 0, metadata !269, metadata !967}
!970 = metadata !{i32 46, i32 0, metadata !269, metadata !967}
!971 = metadata !{i32 47, i32 0, metadata !269, metadata !967}
!972 = metadata !{i32 48, i32 0, metadata !272, metadata !967}
!973 = metadata !{i32 49, i32 0, metadata !272, metadata !967}
!974 = metadata !{i32 259, i32 0, metadata !390, null}
!975 = metadata !{i32 261, i32 0, metadata !390, null}
!976 = metadata !{i32 262, i32 0, metadata !390, null}
!977 = metadata !{i32 264, i32 0, metadata !390, null}
!978 = metadata !{i32 265, i32 0, metadata !390, null}
!979 = metadata !{i32 267, i32 0, metadata !390, null}
!980 = metadata !{i32 1428, i32 0, metadata !148, metadata !981}
!981 = metadata !{i32 269, i32 0, metadata !390, null}
!982 = metadata !{i32 1415, i32 0, metadata !138, metadata !983}
!983 = metadata !{i32 1429, i32 0, metadata !356, metadata !981}
!984 = metadata !{i32 1417, i32 0, metadata !346, metadata !983}
!985 = metadata !{i32 1418, i32 0, metadata !346, metadata !983}
!986 = metadata !{i32 1432, i32 0, metadata !356, metadata !981}
!987 = metadata !{i32 1433, i32 0, metadata !359, metadata !981}
!988 = metadata !{i32 1434, i32 0, metadata !359, metadata !981}
!989 = metadata !{i32 1436, i32 0, metadata !359, metadata !981}
!990 = metadata !{i32 1439, i32 0, metadata !359, metadata !981}
!991 = metadata !{i32 1442, i32 0, metadata !361, metadata !981}
!992 = metadata !{i32 1443, i32 0, metadata !361, metadata !981}
!993 = metadata !{i32 1444, i32 0, metadata !361, metadata !981}
!994 = metadata !{i32 1445, i32 0, metadata !361, metadata !981}
!995 = metadata !{i32 270, i32 0, metadata !390, null}
!996 = metadata !{i32 271, i32 0, metadata !390, null}
!997 = metadata !{i32 277, i32 0, metadata !170, null}
!998 = metadata !{i32 278, i32 0, metadata !396, null}
!999 = metadata !{i32 63, i32 0, metadata !59, metadata !1000}
!1000 = metadata !{i32 279, i32 0, metadata !398, null}
!1001 = metadata !{i32 64, i32 0, metadata !276, metadata !1000}
!1002 = metadata !{i32 65, i32 0, metadata !275, metadata !1000}
!1003 = metadata !{i32 66, i32 0, metadata !275, metadata !1000}
!1004 = metadata !{i32 281, i32 0, metadata !398, null}
!1005 = metadata !{i32 282, i32 0, metadata !398, null}
!1006 = metadata !{i32 283, i32 0, metadata !398, null}
!1007 = metadata !{i32 284, i32 0, metadata !398, null}
!1008 = metadata !{i32 285, i32 0, metadata !398, null}
!1009 = metadata !{i32 286, i32 0, metadata !398, null}
!1010 = metadata !{i32 287, i32 0, metadata !398, null}
!1011 = metadata !{i32 289, i32 0, metadata !398, null}
!1012 = metadata !{i32 39, i32 0, metadata !0, metadata !1013}
!1013 = metadata !{i32 291, i32 0, metadata !396, null}
!1014 = metadata !{i32 40, i32 0, metadata !269, metadata !1013}
!1015 = metadata !{i32 43, i32 0, metadata !269, metadata !1013}
!1016 = metadata !{i32 46, i32 0, metadata !269, metadata !1013}
!1017 = metadata !{i32 47, i32 0, metadata !269, metadata !1013}
!1018 = metadata !{i32 48, i32 0, metadata !272, metadata !1013}
!1019 = metadata !{i32 49, i32 0, metadata !272, metadata !1013}
!1020 = metadata !{i32 292, i32 0, metadata !396, null}
!1021 = metadata !{i32 297, i32 0, metadata !396, null}
!1022 = metadata !{i32 1428, i32 0, metadata !148, metadata !1021}
!1023 = metadata !{i32 1415, i32 0, metadata !138, metadata !1024}
!1024 = metadata !{i32 1429, i32 0, metadata !356, metadata !1021}
!1025 = metadata !{i32 1417, i32 0, metadata !346, metadata !1024}
!1026 = metadata !{i32 1418, i32 0, metadata !346, metadata !1024}
!1027 = metadata !{i32 1432, i32 0, metadata !356, metadata !1021}
!1028 = metadata !{i32 1433, i32 0, metadata !359, metadata !1021}
!1029 = metadata !{i32 1434, i32 0, metadata !359, metadata !1021}
!1030 = metadata !{i32 1436, i32 0, metadata !359, metadata !1021}
!1031 = metadata !{i32 1439, i32 0, metadata !359, metadata !1021}
!1032 = metadata !{i32 1442, i32 0, metadata !361, metadata !1021}
!1033 = metadata !{i32 1443, i32 0, metadata !361, metadata !1021}
!1034 = metadata !{i32 1444, i32 0, metadata !361, metadata !1021}
!1035 = metadata !{i32 1445, i32 0, metadata !361, metadata !1021}
!1036 = metadata !{i32 298, i32 0, metadata !396, null}
!1037 = metadata !{i32 299, i32 0, metadata !396, null}
!1038 = metadata !{i32 1294, i32 0, metadata !176, null}
!1039 = metadata !{i32 1295, i32 0, metadata !176, null}
!1040 = metadata !{i32 1296, i32 0, metadata !411, null}
!1041 = metadata !{i32 1297, i32 0, metadata !411, null}
!1042 = metadata !{i32 1299, i32 0, metadata !411, null}
!1043 = metadata !{i32 1303, i32 0, metadata !411, null}
!1044 = metadata !{i32 1300, i32 0, metadata !411, null}
!1045 = metadata !{i32 1301, i32 0, metadata !411, null}
!1046 = metadata !{i32 1306, i32 0, metadata !411, null}
!1047 = metadata !{i32 1310, i32 0, metadata !411, null}
!1048 = metadata !{i32 1307, i32 0, metadata !411, null}
!1049 = metadata !{i32 1308, i32 0, metadata !411, null}
!1050 = metadata !{i32 1313, i32 0, metadata !411, null}
!1051 = metadata !{i32 1317, i32 0, metadata !411, null}
!1052 = metadata !{i32 1314, i32 0, metadata !411, null}
!1053 = metadata !{i32 1315, i32 0, metadata !411, null}
!1054 = metadata !{i32 1320, i32 0, metadata !411, null}
!1055 = metadata !{i32 1321, i32 0, metadata !411, null}
!1056 = metadata !{i32 1322, i32 0, metadata !411, null}
!1057 = metadata !{i32 1325, i32 0, metadata !411, null}
!1058 = metadata !{i32 1326, i32 0, metadata !411, null}
!1059 = metadata !{i32 64, i32 0, metadata !276, metadata !1060}
!1060 = metadata !{i32 1327, i32 0, metadata !421, null}
!1061 = metadata !{i32 66, i32 0, metadata !275, metadata !1060}
!1062 = metadata !{i32 1328, i32 0, metadata !421, null}
!1063 = metadata !{i32 undef}
!1064 = metadata !{i32 63, i32 0, metadata !59, metadata !1060}
!1065 = metadata !{i32 1329, i32 0, metadata !421, null}
!1066 = metadata !{i32 1330, i32 0, metadata !421, null}
!1067 = metadata !{i32 1331, i32 0, metadata !421, null}
!1068 = metadata !{i32 1333, i32 0, metadata !421, null}
!1069 = metadata !{i32 1334, i32 0, metadata !421, null}
!1070 = metadata !{i32 1335, i32 0, metadata !421, null}
!1071 = metadata !{i32 1336, i32 0, metadata !421, null}
!1072 = metadata !{i32 1338, i32 0, metadata !421, null}
!1073 = metadata !{i32 1339, i32 0, metadata !421, null}
!1074 = metadata !{i32 1340, i32 0, metadata !421, null}
!1075 = metadata !{i32 1341, i32 0, metadata !421, null}
!1076 = metadata !{i32 1346, i32 0, metadata !411, null}
!1077 = metadata !{i32 1349, i32 0, metadata !423, null}
!1078 = metadata !{i32 1351, i32 0, metadata !423, null}
!1079 = metadata !{i32 1353, i32 0, metadata !423, null}
!1080 = metadata !{i32 1356, i32 0, metadata !423, null}
!1081 = metadata !{i32 1357, i32 0, metadata !423, null}
!1082 = metadata !{i32 1358, i32 0, metadata !423, null}
!1083 = metadata !{i32 1361, i32 0, metadata !423, null}
!1084 = metadata !{i32 1364, i32 0, metadata !423, null}
!1085 = metadata !{i32 64, i32 0, metadata !276, metadata !1086}
!1086 = metadata !{i32 1365, i32 0, metadata !426, null}
!1087 = metadata !{i32 66, i32 0, metadata !275, metadata !1086}
!1088 = metadata !{i32 1366, i32 0, metadata !426, null}
!1089 = metadata !{i32 1367, i32 0, metadata !426, null}
!1090 = metadata !{i32 1368, i32 0, metadata !426, null}
!1091 = metadata !{i32 1369, i32 0, metadata !426, null}
!1092 = metadata !{i32 303, i32 0, metadata !190, null}
!1093 = metadata !{i32 306, i32 0, metadata !429, null}
!1094 = metadata !{i32 308, i32 0, metadata !429, null}
!1095 = metadata !{i32 63, i32 0, metadata !59, metadata !1096}
!1096 = metadata !{i32 310, i32 0, metadata !429, null}
!1097 = metadata !{i32 64, i32 0, metadata !276, metadata !1096}
!1098 = metadata !{i32 65, i32 0, metadata !275, metadata !1096}
!1099 = metadata !{i32 66, i32 0, metadata !275, metadata !1096}
!1100 = metadata !{i32 311, i32 0, metadata !429, null}
!1101 = metadata !{i32 312, i32 0, metadata !429, null}
!1102 = metadata !{i32 313, i32 0, metadata !429, null}
!1103 = metadata !{i32 316, i32 0, metadata !429, null}
!1104 = metadata !{i32 317, i32 0, metadata !429, null}
!1105 = metadata !{i32 318, i32 0, metadata !429, null}
!1106 = metadata !{i32 319, i32 0, metadata !429, null}
!1107 = metadata !{i32 330, i32 0, metadata !429, null}
!1108 = metadata !{i32 332, i32 0, metadata !429, null}
!1109 = metadata !{i32 1156, i32 0, metadata !191, null}
!1110 = metadata !{i32 63, i32 0, metadata !59, metadata !1111}
!1111 = metadata !{i32 1157, i32 0, metadata !434, null}
!1112 = metadata !{i32 64, i32 0, metadata !276, metadata !1111}
!1113 = metadata !{i32 65, i32 0, metadata !275, metadata !1111}
!1114 = metadata !{i32 66, i32 0, metadata !275, metadata !1111}
!1115 = metadata !{i32 1159, i32 0, metadata !434, null}
!1116 = metadata !{i32 1160, i32 0, metadata !434, null}
!1117 = metadata !{i32 1161, i32 0, metadata !434, null}
!1118 = metadata !{i32 1163, i32 0, metadata !436, null}
!1119 = metadata !{i32 1164, i32 0, metadata !436, null}
!1120 = metadata !{i32 303, i32 0, metadata !190, metadata !1119}
!1121 = metadata !{i32 306, i32 0, metadata !429, metadata !1119}
!1122 = metadata !{i32 308, i32 0, metadata !429, metadata !1119}
!1123 = metadata !{i32 63, i32 0, metadata !59, metadata !1124}
!1124 = metadata !{i32 310, i32 0, metadata !429, metadata !1119}
!1125 = metadata !{i32 64, i32 0, metadata !276, metadata !1124}
!1126 = metadata !{i32 65, i32 0, metadata !275, metadata !1124}
!1127 = metadata !{i32 311, i32 0, metadata !429, metadata !1119}
!1128 = metadata !{i32 312, i32 0, metadata !429, metadata !1119}
!1129 = metadata !{i32 313, i32 0, metadata !429, metadata !1119}
!1130 = metadata !{i32 316, i32 0, metadata !429, metadata !1119}
!1131 = metadata !{i32 317, i32 0, metadata !429, metadata !1119}
!1132 = metadata !{i32 318, i32 0, metadata !429, metadata !1119}
!1133 = metadata !{i32 319, i32 0, metadata !429, metadata !1119}
!1134 = metadata !{i32 330, i32 0, metadata !429, metadata !1119}
!1135 = metadata !{i32 332, i32 0, metadata !429, metadata !1119}
!1136 = metadata !{i32 1168, i32 0, metadata !436, null}
!1137 = metadata !{i32 1170, i32 0, metadata !436, null}
!1138 = metadata !{i32 1177, i32 0, metadata !436, null}
!1139 = metadata !{i32 1181, i32 0, metadata !194, null}
!1140 = metadata !{i32 63, i32 0, metadata !59, metadata !1141}
!1141 = metadata !{i32 1182, i32 0, metadata !439, null}
!1142 = metadata !{i32 64, i32 0, metadata !276, metadata !1141}
!1143 = metadata !{i32 65, i32 0, metadata !275, metadata !1141}
!1144 = metadata !{i32 66, i32 0, metadata !275, metadata !1141}
!1145 = metadata !{i32 1183, i32 0, metadata !439, null}
!1146 = metadata !{i32 1184, i32 0, metadata !439, null}
!1147 = metadata !{i32 1185, i32 0, metadata !439, null}
!1148 = metadata !{i32 1189, i32 0, metadata !441, null}
!1149 = metadata !{i32 1188, i32 0, metadata !441, null}
!1150 = metadata !{i32 1191, i32 0, metadata !441, null}
!1151 = metadata !{i32 1192, i32 0, metadata !441, null}
!1152 = metadata !{i32 1193, i32 0, metadata !441, null}
!1153 = metadata !{i32 1195, i32 0, metadata !441, null}
!1154 = metadata !{i32 128, i32 0, metadata !195, null}
!1155 = metadata !{i32 133, i32 0, metadata !446, null}
!1156 = metadata !{i32 134, i32 0, metadata !446, null}
!1157 = metadata !{i32 136, i32 0, metadata !446, null}
!1158 = metadata !{i32 137, i32 0, metadata !446, null}
!1159 = metadata !{i32 138, i32 0, metadata !446, null}
!1160 = metadata !{i32 141, i32 0, metadata !446, null}
!1161 = metadata !{i32 144, i32 0, metadata !446, null}
!1162 = metadata !{i32 39, i32 0, metadata !0, metadata !1163}
!1163 = metadata !{i32 146, i32 0, metadata !446, null}
!1164 = metadata !{i32 40, i32 0, metadata !269, metadata !1163}
!1165 = metadata !{i32 43, i32 0, metadata !269, metadata !1163}
!1166 = metadata !{i32 46, i32 0, metadata !269, metadata !1163}
!1167 = metadata !{i32 47, i32 0, metadata !269, metadata !1163}
!1168 = metadata !{i32 48, i32 0, metadata !272, metadata !1163}
!1169 = metadata !{i32 49, i32 0, metadata !272, metadata !1163}
!1170 = metadata !{i32 147, i32 0, metadata !446, null}
!1171 = metadata !{i32 150, i32 0, metadata !446, null}
!1172 = metadata !{i32 153, i32 0, metadata !446, null}
!1173 = metadata !{i32 154, i32 0, metadata !446, null}
!1174 = metadata !{i32 168, i32 0, metadata !446, null}
!1175 = metadata !{i32 169, i32 0, metadata !446, null}
!1176 = metadata !{i32 170, i32 0, metadata !446, null}
!1177 = metadata !{i32 173, i32 0, metadata !446, null}
!1178 = metadata !{i32 97, i32 0, metadata !76, metadata !1177}
!1179 = metadata !{i32 99, i32 0, metadata !283, metadata !1177}
!1180 = metadata !{i32 101, i32 0, metadata !283, metadata !1177}
!1181 = metadata !{i32 107, i32 0, metadata !283, metadata !1177}
!1182 = metadata !{i32 118, i32 0, metadata !283, metadata !1177}
!1183 = metadata !{i32 121, i32 0, metadata !283, metadata !1177}
!1184 = metadata !{i32 174, i32 0, metadata !446, null}
!1185 = metadata !{i32 175, i32 0, metadata !446, null}
!1186 = metadata !{i32 178, i32 0, metadata !446, null}
!1187 = metadata !{i32 1428, i32 0, metadata !148, metadata !1188}
!1188 = metadata !{i32 181, i32 0, metadata !450, null}
!1189 = metadata !{i32 1415, i32 0, metadata !138, metadata !1190}
!1190 = metadata !{i32 1429, i32 0, metadata !356, metadata !1188}
!1191 = metadata !{i32 1417, i32 0, metadata !346, metadata !1190}
!1192 = metadata !{i32 1418, i32 0, metadata !346, metadata !1190}
!1193 = metadata !{i32 1432, i32 0, metadata !356, metadata !1188}
!1194 = metadata !{i32 1433, i32 0, metadata !359, metadata !1188}
!1195 = metadata !{i32 1434, i32 0, metadata !359, metadata !1188}
!1196 = metadata !{i32 1436, i32 0, metadata !359, metadata !1188}
!1197 = metadata !{i32 1439, i32 0, metadata !359, metadata !1188}
!1198 = metadata !{i32 1442, i32 0, metadata !361, metadata !1188}
!1199 = metadata !{i32 1443, i32 0, metadata !361, metadata !1188}
!1200 = metadata !{i32 1444, i32 0, metadata !361, metadata !1188}
!1201 = metadata !{i32 1445, i32 0, metadata !361, metadata !1188}
!1202 = metadata !{i32 182, i32 0, metadata !450, null}
!1203 = metadata !{i32 183, i32 0, metadata !450, null}
!1204 = metadata !{i32 184, i32 0, metadata !450, null}
!1205 = metadata !{i32 186, i32 0, metadata !450, null}
!1206 = metadata !{i32 190, i32 0, metadata !446, null}
!1207 = metadata !{i32 189, i32 0, metadata !446, null}
!1208 = metadata !{i32 191, i32 0, metadata !446, null}
!1209 = metadata !{i32 193, i32 0, metadata !446, null}
!1210 = metadata !{i32 195, i32 0, metadata !446, null}
!1211 = metadata !{i32 201, i32 0, metadata !198, null}
!1212 = metadata !{i32 204, i32 0, metadata !456, null}
!1213 = metadata !{i32 63, i32 0, metadata !59, metadata !1214}
!1214 = metadata !{i32 205, i32 0, metadata !460, null}
!1215 = metadata !{i32 64, i32 0, metadata !276, metadata !1214}
!1216 = metadata !{i32 65, i32 0, metadata !275, metadata !1214}
!1217 = metadata !{i32 66, i32 0, metadata !275, metadata !1214}
!1218 = metadata !{i32 207, i32 0, metadata !460, null}
!1219 = metadata !{i32 208, i32 0, metadata !460, null}
!1220 = metadata !{i32 209, i32 0, metadata !460, null}
!1221 = metadata !{i32 210, i32 0, metadata !460, null}
!1222 = metadata !{i32 211, i32 0, metadata !460, null}
!1223 = metadata !{i32 212, i32 0, metadata !460, null}
!1224 = metadata !{i32 213, i32 0, metadata !460, null}
!1225 = metadata !{i32 215, i32 0, metadata !460, null}
!1226 = metadata !{i32 39, i32 0, metadata !0, metadata !1227}
!1227 = metadata !{i32 218, i32 0, metadata !456, null}
!1228 = metadata !{i32 40, i32 0, metadata !269, metadata !1227}
!1229 = metadata !{i32 43, i32 0, metadata !269, metadata !1227}
!1230 = metadata !{i32 46, i32 0, metadata !269, metadata !1227}
!1231 = metadata !{i32 47, i32 0, metadata !269, metadata !1227}
!1232 = metadata !{i32 48, i32 0, metadata !272, metadata !1227}
!1233 = metadata !{i32 49, i32 0, metadata !272, metadata !1227}
!1234 = metadata !{i32 220, i32 0, metadata !456, null}
!1235 = metadata !{i32 224, i32 0, metadata !456, null}
!1236 = metadata !{i32 223, i32 0, metadata !456, null}
!1237 = metadata !{i32 226, i32 0, metadata !456, null}
!1238 = metadata !{i32 227, i32 0, metadata !456, null}
!1239 = metadata !{i32 228, i32 0, metadata !456, null}
!1240 = metadata !{i32 231, i32 0, metadata !456, null}
!1241 = metadata !{i32 234, i32 0, metadata !456, null}
!1242 = metadata !{i32 236, i32 0, metadata !456, null}
!1243 = metadata !{i32 1428, i32 0, metadata !148, metadata !1242}
!1244 = metadata !{i32 1415, i32 0, metadata !138, metadata !1245}
!1245 = metadata !{i32 1429, i32 0, metadata !356, metadata !1242}
!1246 = metadata !{i32 1417, i32 0, metadata !346, metadata !1245}
!1247 = metadata !{i32 1418, i32 0, metadata !346, metadata !1245}
!1248 = metadata !{i32 1432, i32 0, metadata !356, metadata !1242}
!1249 = metadata !{i32 1433, i32 0, metadata !359, metadata !1242}
!1250 = metadata !{i32 1434, i32 0, metadata !359, metadata !1242}
!1251 = metadata !{i32 1436, i32 0, metadata !359, metadata !1242}
!1252 = metadata !{i32 1439, i32 0, metadata !359, metadata !1242}
!1253 = metadata !{i32 1442, i32 0, metadata !361, metadata !1242}
!1254 = metadata !{i32 1443, i32 0, metadata !361, metadata !1242}
!1255 = metadata !{i32 1444, i32 0, metadata !361, metadata !1242}
!1256 = metadata !{i32 1445, i32 0, metadata !361, metadata !1242}
!1257 = metadata !{i32 237, i32 0, metadata !456, null}
!1258 = metadata !{i32 238, i32 0, metadata !456, null}
!1259 = metadata !{i32 239, i32 0, metadata !456, null}
!1260 = metadata !{i32 242, i32 0, metadata !456, null}
!1261 = metadata !{i32 243, i32 0, metadata !456, null}
!1262 = metadata !{i32 244, i32 0, metadata !456, null}
!1263 = metadata !{i32 245, i32 0, metadata !456, null}
!1264 = metadata !{i32 247, i32 0, metadata !456, null}
!1265 = metadata !{i32 249, i32 0, metadata !456, null}
!1266 = metadata !{i32 1048, i32 0, metadata !201, null}
!1267 = metadata !{i32 1050, i32 0, metadata !464, null}
!1268 = metadata !{i32 63, i32 0, metadata !59, metadata !1269}
!1269 = metadata !{i32 1049, i32 0, metadata !464, null}
!1270 = metadata !{i32 64, i32 0, metadata !276, metadata !1269}
!1271 = metadata !{i32 65, i32 0, metadata !275, metadata !1269}
!1272 = metadata !{i32 66, i32 0, metadata !275, metadata !1269}
!1273 = metadata !{i32 1053, i32 0, metadata !464, null}
!1274 = metadata !{i32 1054, i32 0, metadata !464, null}
!1275 = metadata !{i32 1055, i32 0, metadata !464, null}
!1276 = metadata !{i32 1058, i32 0, metadata !464, null}
!1277 = metadata !{i32 1062, i32 0, metadata !464, null}
!1278 = metadata !{i32 1063, i32 0, metadata !464, null}
!1279 = metadata !{i32 1064, i32 0, metadata !464, null}
!1280 = metadata !{i32 1067, i32 0, metadata !464, null}
!1281 = metadata !{i32 1068, i32 0, metadata !464, null}
!1282 = metadata !{i32 1070, i32 0, metadata !480, null}
!1283 = metadata !{i32 1071, i32 0, metadata !480, null}
!1284 = metadata !{i32 1}
!1285 = metadata !{i32 1072, i32 0, metadata !480, null}
!1286 = metadata !{i32 1076, i32 0, metadata !464, null}
!1287 = metadata !{i32 1077, i32 0, metadata !464, null}
!1288 = metadata !{i32 1078, i32 0, metadata !464, null}
!1289 = metadata !{i32 1091, i32 0, metadata !464, null}
!1290 = metadata !{i32 1092, i32 0, metadata !464, null}
!1291 = metadata !{i32 1093, i32 0, metadata !464, null}
!1292 = metadata !{i32 1096, i32 0, metadata !482, null}
!1293 = metadata !{i32 1097, i32 0, metadata !482, null}
!1294 = metadata !{i32 1098, i32 0, metadata !482, null}
!1295 = metadata !{i32 898, i32 0, metadata !202, null}
!1296 = metadata !{i32 903, i32 0, metadata !486, null}
!1297 = metadata !{i32 63, i32 0, metadata !59, metadata !1298}
!1298 = metadata !{i32 902, i32 0, metadata !486, null}
!1299 = metadata !{i32 64, i32 0, metadata !276, metadata !1298}
!1300 = metadata !{i32 65, i32 0, metadata !275, metadata !1298}
!1301 = metadata !{i32 66, i32 0, metadata !275, metadata !1298}
!1302 = metadata !{i32 910, i32 0, metadata !486, null}
!1303 = metadata !{i32 911, i32 0, metadata !486, null}
!1304 = metadata !{i32 912, i32 0, metadata !486, null}
!1305 = metadata !{i32 915, i32 0, metadata !486, null}
!1306 = metadata !{i32 916, i32 0, metadata !486, null}
!1307 = metadata !{i32 917, i32 0, metadata !486, null}
!1308 = metadata !{i32 919, i32 0, metadata !486, null}
!1309 = metadata !{i32 920, i32 0, metadata !490, null}
!1310 = metadata !{i32 922, i32 0, metadata !490, null}
!1311 = metadata !{i32 924, i32 0, metadata !492, null}
!1312 = metadata !{i32 926, i32 0, metadata !492, null}
!1313 = metadata !{i32 929, i32 0, metadata !492, null}
!1314 = metadata !{i32 932, i32 0, metadata !492, null}
!1315 = metadata !{i32 933, i32 0, metadata !492, null}
!1316 = metadata !{i32 934, i32 0, metadata !492, null}
!1317 = metadata !{i32 935, i32 0, metadata !492, null}
!1318 = metadata !{i32 936, i32 0, metadata !492, null}
!1319 = metadata !{i32 937, i32 0, metadata !492, null}
!1320 = metadata !{i32 938, i32 0, metadata !492, null}
!1321 = metadata !{i32 939, i32 0, metadata !492, null}
!1322 = metadata !{i32 940, i32 0, metadata !492, null}
!1323 = metadata !{i32 941, i32 0, metadata !492, null}
!1324 = metadata !{i32 942, i32 0, metadata !492, null}
!1325 = metadata !{i32 943, i32 0, metadata !492, null}
!1326 = metadata !{i32 944, i32 0, metadata !492, null}
!1327 = metadata !{i32 945, i32 0, metadata !492, null}
!1328 = metadata !{i32 946, i32 0, metadata !492, null}
!1329 = metadata !{i32 947, i32 0, metadata !492, null}
!1330 = metadata !{i32 948, i32 0, metadata !492, null}
!1331 = metadata !{i32 949, i32 0, metadata !492, null}
!1332 = metadata !{i32 950, i32 0, metadata !492, null}
!1333 = metadata !{i32 951, i32 0, metadata !492, null}
!1334 = metadata !{i32 952, i32 0, metadata !492, null}
!1335 = metadata !{i32 953, i32 0, metadata !492, null}
!1336 = metadata !{i32 954, i32 0, metadata !492, null}
!1337 = metadata !{i32 955, i32 0, metadata !492, null}
!1338 = metadata !{i32 956, i32 0, metadata !492, null}
!1339 = metadata !{i32 958, i32 0, metadata !492, null}
!1340 = metadata !{i32 959, i32 0, metadata !492, null}
!1341 = metadata !{i32 964, i32 0, metadata !490, null}
!1342 = metadata !{i32 965, i32 0, metadata !490, null}
!1343 = metadata !{i32 968, i32 0, metadata !490, null}
!1344 = metadata !{i32 969, i32 0, metadata !490, null}
!1345 = metadata !{i32 974, i32 0, metadata !490, null}
!1346 = metadata !{i32 975, i32 0, metadata !490, null}
!1347 = metadata !{i32 978, i32 0, metadata !490, null}
!1348 = metadata !{i32 979, i32 0, metadata !490, null}
!1349 = metadata !{i32 984, i32 0, metadata !490, null}
!1350 = metadata !{i32 985, i32 0, metadata !490, null}
!1351 = metadata !{i32 988, i32 0, metadata !490, null}
!1352 = metadata !{i32 989, i32 0, metadata !490, null}
!1353 = metadata !{i32 993, i32 0, metadata !512, null}
!1354 = metadata !{i32 994, i32 0, metadata !512, null}
!1355 = metadata !{i32 995, i32 0, metadata !512, null}
!1356 = metadata !{i32 996, i32 0, metadata !512, null}
!1357 = metadata !{i32 997, i32 0, metadata !512, null}
!1358 = metadata !{i32 1000, i32 0, metadata !512, null}
!1359 = metadata !{i32 1001, i32 0, metadata !512, null}
!1360 = metadata !{i32 1006, i32 0, metadata !490, null}
!1361 = metadata !{i32 1007, i32 0, metadata !490, null}
!1362 = metadata !{i32 1008, i32 0, metadata !490, null}
!1363 = metadata !{i32 1009, i32 0, metadata !490, null}
!1364 = metadata !{i32 1011, i32 0, metadata !490, null}
!1365 = metadata !{i32 1012, i32 0, metadata !490, null}
!1366 = metadata !{i32 1016, i32 0, metadata !522, null}
!1367 = metadata !{i32 1017, i32 0, metadata !522, null}
!1368 = metadata !{i32 1018, i32 0, metadata !522, null}
!1369 = metadata !{i32 1019, i32 0, metadata !522, null}
!1370 = metadata !{i32 1020, i32 0, metadata !522, null}
!1371 = metadata !{i32 1024, i32 0, metadata !522, null}
!1372 = metadata !{i32 1026, i32 0, metadata !522, null}
!1373 = metadata !{i32 1027, i32 0, metadata !522, null}
!1374 = metadata !{i32 1031, i32 0, metadata !490, null}
!1375 = metadata !{i32 1032, i32 0, metadata !490, null}
!1376 = metadata !{i32 1033, i32 0, metadata !490, null}
!1377 = metadata !{i32 1036, i32 0, metadata !490, null}
!1378 = metadata !{i32 1037, i32 0, metadata !490, null}
!1379 = metadata !{i32 1038, i32 0, metadata !490, null}
!1380 = metadata !{i32 1041, i32 0, metadata !525, null}
!1381 = metadata !{i32 1042, i32 0, metadata !525, null}
!1382 = metadata !{i32 1043, i32 0, metadata !525, null}
!1383 = metadata !{i32 814, i32 0, metadata !205, null}
!1384 = metadata !{i32 63, i32 0, metadata !59, metadata !1385}
!1385 = metadata !{i32 815, i32 0, metadata !530, null}
!1386 = metadata !{i32 64, i32 0, metadata !276, metadata !1385}
!1387 = metadata !{i32 65, i32 0, metadata !275, metadata !1385}
!1388 = metadata !{i32 66, i32 0, metadata !275, metadata !1385}
!1389 = metadata !{i32 817, i32 0, metadata !530, null}
!1390 = metadata !{i32 818, i32 0, metadata !530, null}
!1391 = metadata !{i32 819, i32 0, metadata !530, null}
!1392 = metadata !{i32 822, i32 0, metadata !530, null}
!1393 = metadata !{i32 823, i32 0, metadata !530, null}
!1394 = metadata !{i32 824, i32 0, metadata !530, null}
!1395 = metadata !{i32 825, i32 0, metadata !530, null}
!1396 = metadata !{i32 827, i32 0, metadata !530, null}
!1397 = metadata !{i64 0}
!1398 = metadata !{i32 829, i32 0, metadata !532, null}
!1399 = metadata !{i32 832, i32 0, metadata !532, null}
!1400 = metadata !{i32 833, i32 0, metadata !532, null}
!1401 = metadata !{i32 838, i32 0, metadata !532, null}
!1402 = metadata !{i32 835, i32 0, metadata !532, null}
!1403 = metadata !{i32 836, i32 0, metadata !532, null}
!1404 = metadata !{i32 839, i32 0, metadata !536, null}
!1405 = metadata !{i32 840, i32 0, metadata !536, null}
!1406 = metadata !{i32 841, i32 0, metadata !536, null}
!1407 = metadata !{i32 842, i32 0, metadata !536, null}
!1408 = metadata !{i32 843, i32 0, metadata !536, null}
!1409 = metadata !{i32 844, i32 0, metadata !536, null}
!1410 = metadata !{i32 845, i32 0, metadata !536, null}
!1411 = metadata !{i32 846, i32 0, metadata !536, null}
!1412 = metadata !{i32 847, i32 0, metadata !536, null}
!1413 = metadata !{i32 851, i32 0, metadata !532, null}
!1414 = metadata !{i32 852, i32 0, metadata !532, null}
!1415 = metadata !{i32 853, i32 0, metadata !532, null}
!1416 = metadata !{i32 854, i32 0, metadata !532, null}
!1417 = metadata !{i32 855, i32 0, metadata !532, null}
!1418 = metadata !{i32 856, i32 0, metadata !532, null}
!1419 = metadata !{i32 857, i32 0, metadata !532, null}
!1420 = metadata !{i32 858, i32 0, metadata !532, null}
!1421 = metadata !{i32 860, i32 0, metadata !532, null}
!1422 = metadata !{i32 862, i32 0, metadata !538, null}
!1423 = metadata !{i32 864, i32 0, metadata !538, null}
!1424 = metadata !{i32 873, i32 0, metadata !538, null}
!1425 = metadata !{i32 874, i32 0, metadata !538, null}
!1426 = metadata !{i32 875, i32 0, metadata !538, null}
!1427 = metadata !{i32 876, i32 0, metadata !538, null}
!1428 = metadata !{i32 877, i32 0, metadata !538, null}
!1429 = metadata !{i32 878, i32 0, metadata !538, null}
!1430 = metadata !{i32 880, i32 0, metadata !542, null}
!1431 = metadata !{i32 881, i32 0, metadata !542, null}
!1432 = metadata !{i32 885, i32 0, metadata !542, null}
!1433 = metadata !{i32 886, i32 0, metadata !544, null}
!1434 = metadata !{i32 887, i32 0, metadata !544, null}
!1435 = metadata !{i32 888, i32 0, metadata !544, null}
!1436 = metadata !{i32 475, i32 0, metadata !223, null}
!1437 = metadata !{i32 63, i32 0, metadata !59, metadata !1438}
!1438 = metadata !{i32 477, i32 0, metadata !549, null}
!1439 = metadata !{i32 64, i32 0, metadata !276, metadata !1438}
!1440 = metadata !{i32 65, i32 0, metadata !275, metadata !1438}
!1441 = metadata !{i32 66, i32 0, metadata !275, metadata !1438}
!1442 = metadata !{i32 479, i32 0, metadata !549, null}
!1443 = metadata !{i32 480, i32 0, metadata !549, null}
!1444 = metadata !{i32 481, i32 0, metadata !549, null}
!1445 = metadata !{i32 484, i32 0, metadata !549, null}
!1446 = metadata !{i32 491, i32 0, metadata !549, null}
!1447 = metadata !{i32 492, i32 0, metadata !549, null}
!1448 = metadata !{i32 494, i32 0, metadata !549, null}
!1449 = metadata !{i32 498, i32 0, metadata !549, null}
!1450 = metadata !{i32 499, i32 0, metadata !549, null}
!1451 = metadata !{i32 500, i32 0, metadata !549, null}
!1452 = metadata !{i32 504, i32 0, metadata !549, null}
!1453 = metadata !{i32 505, i32 0, metadata !549, null}
!1454 = metadata !{i32 506, i32 0, metadata !549, null}
!1455 = metadata !{i32 509, i32 0, metadata !549, null}
!1456 = metadata !{i32 510, i32 0, metadata !549, null}
!1457 = metadata !{i32 513, i32 0, metadata !549, null}
!1458 = metadata !{i32 515, i32 0, metadata !549, null}
!1459 = metadata !{i32 516, i32 0, metadata !549, null}
!1460 = metadata !{i32 518, i32 0, metadata !549, null}
!1461 = metadata !{i32 519, i32 0, metadata !549, null}
!1462 = metadata !{i32 523, i32 0, metadata !549, null}
!1463 = metadata !{i32 524, i32 0, metadata !549, null}
!1464 = metadata !{i32 525, i32 0, metadata !549, null}
!1465 = metadata !{i32 528, i32 0, metadata !549, null}
!1466 = metadata !{i32 529, i32 0, metadata !549, null}
!1467 = metadata !{i32 758, i32 0, metadata !226, null}
!1468 = metadata !{i32 63, i32 0, metadata !59, metadata !1469}
!1469 = metadata !{i32 759, i32 0, metadata !554, null}
!1470 = metadata !{i32 64, i32 0, metadata !276, metadata !1469}
!1471 = metadata !{i32 65, i32 0, metadata !275, metadata !1469}
!1472 = metadata !{i32 66, i32 0, metadata !275, metadata !1469}
!1473 = metadata !{i32 761, i32 0, metadata !554, null}
!1474 = metadata !{i32 762, i32 0, metadata !554, null}
!1475 = metadata !{i32 763, i32 0, metadata !554, null}
!1476 = metadata !{i32 766, i32 0, metadata !554, null}
!1477 = metadata !{i32 768, i32 0, metadata !556, null}
!1478 = metadata !{i32 772, i32 0, metadata !556, null}
!1479 = metadata !{i32 773, i32 0, metadata !556, null}
!1480 = metadata !{i32 777, i32 0, metadata !554, null}
!1481 = metadata !{i32 778, i32 0, metadata !554, null}
!1482 = metadata !{i32 587, i32 0, metadata !227, null}
!1483 = metadata !{i32 39, i32 0, metadata !0, metadata !1484}
!1484 = metadata !{i32 588, i32 0, metadata !560, null}
!1485 = metadata !{i32 40, i32 0, metadata !269, metadata !1484}
!1486 = metadata !{i32 43, i32 0, metadata !269, metadata !1484}
!1487 = metadata !{i32 46, i32 0, metadata !269, metadata !1484}
!1488 = metadata !{i32 47, i32 0, metadata !269, metadata !1484}
!1489 = metadata !{i32 48, i32 0, metadata !272, metadata !1484}
!1490 = metadata !{i32 49, i32 0, metadata !272, metadata !1484}
!1491 = metadata !{i32 589, i32 0, metadata !560, null}
!1492 = metadata !{i32 590, i32 0, metadata !560, null}
!1493 = metadata !{i32 591, i32 0, metadata !560, null}
!1494 = metadata !{i32 1428, i32 0, metadata !148, metadata !1495}
!1495 = metadata !{i32 596, i32 0, metadata !562, null}
!1496 = metadata !{i32 1415, i32 0, metadata !138, metadata !1497}
!1497 = metadata !{i32 1429, i32 0, metadata !356, metadata !1495}
!1498 = metadata !{i32 1417, i32 0, metadata !346, metadata !1497}
!1499 = metadata !{i32 1418, i32 0, metadata !346, metadata !1497}
!1500 = metadata !{i32 1432, i32 0, metadata !356, metadata !1495}
!1501 = metadata !{i32 1433, i32 0, metadata !359, metadata !1495}
!1502 = metadata !{i32 1434, i32 0, metadata !359, metadata !1495}
!1503 = metadata !{i32 1436, i32 0, metadata !359, metadata !1495}
!1504 = metadata !{i32 1439, i32 0, metadata !359, metadata !1495}
!1505 = metadata !{i32 1442, i32 0, metadata !361, metadata !1495}
!1506 = metadata !{i32 1443, i32 0, metadata !361, metadata !1495}
!1507 = metadata !{i32 1444, i32 0, metadata !361, metadata !1495}
!1508 = metadata !{i32 1445, i32 0, metadata !361, metadata !1495}
!1509 = metadata !{i32 600, i32 0, metadata !562, null}
!1510 = metadata !{i32 601, i32 0, metadata !562, null}
!1511 = metadata !{i32 551, i32 0, metadata !230, null}
!1512 = metadata !{i32 552, i32 0, metadata !568, null}
!1513 = metadata !{i32 63, i32 0, metadata !59, metadata !1514}
!1514 = metadata !{i32 553, i32 0, metadata !571, null}
!1515 = metadata !{i32 64, i32 0, metadata !276, metadata !1514}
!1516 = metadata !{i32 65, i32 0, metadata !275, metadata !1514}
!1517 = metadata !{i32 66, i32 0, metadata !275, metadata !1514}
!1518 = metadata !{i32 555, i32 0, metadata !571, null}
!1519 = metadata !{i32 556, i32 0, metadata !571, null}
!1520 = metadata !{i32 557, i32 0, metadata !571, null}
!1521 = metadata !{i32 558, i32 0, metadata !571, null}
!1522 = metadata !{i32 559, i32 0, metadata !571, null}
!1523 = metadata !{i32 560, i32 0, metadata !571, null}
!1524 = metadata !{i32 561, i32 0, metadata !571, null}
!1525 = metadata !{i32 563, i32 0, metadata !571, null}
!1526 = metadata !{i32 39, i32 0, metadata !0, metadata !1527}
!1527 = metadata !{i32 565, i32 0, metadata !568, null}
!1528 = metadata !{i32 40, i32 0, metadata !269, metadata !1527}
!1529 = metadata !{i32 43, i32 0, metadata !269, metadata !1527}
!1530 = metadata !{i32 46, i32 0, metadata !269, metadata !1527}
!1531 = metadata !{i32 47, i32 0, metadata !269, metadata !1527}
!1532 = metadata !{i32 48, i32 0, metadata !272, metadata !1527}
!1533 = metadata !{i32 49, i32 0, metadata !272, metadata !1527}
!1534 = metadata !{i32 566, i32 0, metadata !568, null}
!1535 = metadata !{i32 567, i32 0, metadata !568, null}
!1536 = metadata !{i32 568, i32 0, metadata !568, null}
!1537 = metadata !{i32 574, i32 0, metadata !568, null}
!1538 = metadata !{i32 1428, i32 0, metadata !148, metadata !1537}
!1539 = metadata !{i32 1415, i32 0, metadata !138, metadata !1540}
!1540 = metadata !{i32 1429, i32 0, metadata !356, metadata !1537}
!1541 = metadata !{i32 1417, i32 0, metadata !346, metadata !1540}
!1542 = metadata !{i32 1418, i32 0, metadata !346, metadata !1540}
!1543 = metadata !{i32 1432, i32 0, metadata !356, metadata !1537}
!1544 = metadata !{i32 1433, i32 0, metadata !359, metadata !1537}
!1545 = metadata !{i32 1434, i32 0, metadata !359, metadata !1537}
!1546 = metadata !{i32 1436, i32 0, metadata !359, metadata !1537}
!1547 = metadata !{i32 1439, i32 0, metadata !359, metadata !1537}
!1548 = metadata !{i32 1442, i32 0, metadata !361, metadata !1537}
!1549 = metadata !{i32 1443, i32 0, metadata !361, metadata !1537}
!1550 = metadata !{i32 1444, i32 0, metadata !361, metadata !1537}
!1551 = metadata !{i32 1445, i32 0, metadata !361, metadata !1537}
!1552 = metadata !{i32 581, i32 0, metadata !568, null}
!1553 = metadata !{i32 582, i32 0, metadata !568, null}
!1554 = metadata !{i32 532, i32 0, metadata !253, null}
!1555 = metadata !{i32 39, i32 0, metadata !0, metadata !1556}
!1556 = metadata !{i32 533, i32 0, metadata !575, null}
!1557 = metadata !{i32 40, i32 0, metadata !269, metadata !1556}
!1558 = metadata !{i32 43, i32 0, metadata !269, metadata !1556}
!1559 = metadata !{i32 46, i32 0, metadata !269, metadata !1556}
!1560 = metadata !{i32 47, i32 0, metadata !269, metadata !1556}
!1561 = metadata !{i32 48, i32 0, metadata !272, metadata !1556}
!1562 = metadata !{i32 49, i32 0, metadata !272, metadata !1556}
!1563 = metadata !{i32 534, i32 0, metadata !575, null}
!1564 = metadata !{i32 535, i32 0, metadata !575, null}
!1565 = metadata !{i32 536, i32 0, metadata !575, null}
!1566 = metadata !{i32 1428, i32 0, metadata !148, metadata !1567}
!1567 = metadata !{i32 541, i32 0, metadata !577, null}
!1568 = metadata !{i32 1415, i32 0, metadata !138, metadata !1569}
!1569 = metadata !{i32 1429, i32 0, metadata !356, metadata !1567}
!1570 = metadata !{i32 1417, i32 0, metadata !346, metadata !1569}
!1571 = metadata !{i32 1418, i32 0, metadata !346, metadata !1569}
!1572 = metadata !{i32 1432, i32 0, metadata !356, metadata !1567}
!1573 = metadata !{i32 1433, i32 0, metadata !359, metadata !1567}
!1574 = metadata !{i32 1434, i32 0, metadata !359, metadata !1567}
!1575 = metadata !{i32 1436, i32 0, metadata !359, metadata !1567}
!1576 = metadata !{i32 1439, i32 0, metadata !359, metadata !1567}
!1577 = metadata !{i32 1442, i32 0, metadata !361, metadata !1567}
!1578 = metadata !{i32 1443, i32 0, metadata !361, metadata !1567}
!1579 = metadata !{i32 1444, i32 0, metadata !361, metadata !1567}
!1580 = metadata !{i32 1445, i32 0, metadata !361, metadata !1567}
!1581 = metadata !{i32 545, i32 0, metadata !577, null}
!1582 = metadata !{i32 546, i32 0, metadata !577, null}
!1583 = metadata !{i32 403, i32 0, metadata !254, null}
!1584 = metadata !{i32 407, i32 0, metadata !582, null}
!1585 = metadata !{i32 63, i32 0, metadata !59, metadata !1586}
!1586 = metadata !{i32 409, i32 0, metadata !582, null}
!1587 = metadata !{i32 64, i32 0, metadata !276, metadata !1586}
!1588 = metadata !{i32 65, i32 0, metadata !275, metadata !1586}
!1589 = metadata !{i32 66, i32 0, metadata !275, metadata !1586}
!1590 = metadata !{i32 411, i32 0, metadata !582, null}
!1591 = metadata !{i32 412, i32 0, metadata !582, null}
!1592 = metadata !{i32 413, i32 0, metadata !582, null}
!1593 = metadata !{i32 416, i32 0, metadata !582, null}
!1594 = metadata !{i32 417, i32 0, metadata !582, null}
!1595 = metadata !{i32 418, i32 0, metadata !582, null}
!1596 = metadata !{i32 419, i32 0, metadata !582, null}
!1597 = metadata !{i32 422, i32 0, metadata !582, null}
!1598 = metadata !{i32 1415, i32 0, metadata !138, metadata !1599}
!1599 = metadata !{i32 425, i32 0, metadata !584, null}
!1600 = metadata !{i32 1417, i32 0, metadata !346, metadata !1599}
!1601 = metadata !{i32 1418, i32 0, metadata !346, metadata !1599}
!1602 = metadata !{i32 1422, i32 0, metadata !142, metadata !1603}
!1603 = metadata !{i32 426, i32 0, metadata !584, null}
!1604 = metadata !{i32 1423, i32 0, metadata !349, metadata !1603}
!1605 = metadata !{i32 1424, i32 0, metadata !349, metadata !1603}
!1606 = metadata !{i32 430, i32 0, metadata !584, null}
!1607 = metadata !{i32 431, i32 0, metadata !584, null}
!1608 = metadata !{i32 432, i32 0, metadata !584, null}
!1609 = metadata !{i32 433, i32 0, metadata !584, null}
!1610 = metadata !{i32 435, i32 0, metadata !584, null}
!1611 = metadata !{i32 436, i32 0, metadata !584, null}
!1612 = metadata !{i32 437, i32 0, metadata !584, null}
!1613 = metadata !{i32 440, i32 0, metadata !584, null}
!1614 = metadata !{i32 441, i32 0, metadata !584, null}
!1615 = metadata !{i32 444, i32 0, metadata !584, null}
!1616 = metadata !{i32 442, i32 0, metadata !584, null}
!1617 = metadata !{i32 448, i32 0, metadata !586, null}
!1618 = metadata !{i32 449, i32 0, metadata !586, null}
!1619 = metadata !{i32 452, i32 0, metadata !586, null}
!1620 = metadata !{i32 453, i32 0, metadata !586, null}
!1621 = metadata !{i32 455, i32 0, metadata !586, null}
!1622 = metadata !{i32 456, i32 0, metadata !586, null}
!1623 = metadata !{i32 460, i32 0, metadata !586, null}
!1624 = metadata !{i32 461, i32 0, metadata !586, null}
!1625 = metadata !{i32 463, i32 0, metadata !586, null}
!1626 = metadata !{i32 464, i32 0, metadata !586, null}
!1627 = metadata !{i32 466, i32 0, metadata !586, null}
!1628 = metadata !{i32 467, i32 0, metadata !586, null}
!1629 = metadata !{i32 469, i32 0, metadata !586, null}
!1630 = metadata !{i32 470, i32 0, metadata !586, null}
!1631 = metadata !{i32 335, i32 0, metadata !257, null}
!1632 = metadata !{i32 339, i32 0, metadata !591, null}
!1633 = metadata !{i32 341, i32 0, metadata !591, null}
!1634 = metadata !{i32 344, i32 0, metadata !591, null}
!1635 = metadata !{i32 345, i32 0, metadata !591, null}
!1636 = metadata !{i32 346, i32 0, metadata !591, null}
!1637 = metadata !{i32 63, i32 0, metadata !59, metadata !1638}
!1638 = metadata !{i32 349, i32 0, metadata !591, null}
!1639 = metadata !{i32 64, i32 0, metadata !276, metadata !1638}
!1640 = metadata !{i32 65, i32 0, metadata !275, metadata !1638}
!1641 = metadata !{i32 66, i32 0, metadata !275, metadata !1638}
!1642 = metadata !{i32 351, i32 0, metadata !591, null}
!1643 = metadata !{i32 352, i32 0, metadata !591, null}
!1644 = metadata !{i32 353, i32 0, metadata !591, null}
!1645 = metadata !{i32 356, i32 0, metadata !591, null}
!1646 = metadata !{i32 357, i32 0, metadata !591, null}
!1647 = metadata !{i32 358, i32 0, metadata !591, null}
!1648 = metadata !{i32 359, i32 0, metadata !591, null}
!1649 = metadata !{i32 362, i32 0, metadata !591, null}
!1650 = metadata !{i32 1415, i32 0, metadata !138, metadata !1651}
!1651 = metadata !{i32 365, i32 0, metadata !593, null}
!1652 = metadata !{i32 1417, i32 0, metadata !346, metadata !1651}
!1653 = metadata !{i32 1418, i32 0, metadata !346, metadata !1651}
!1654 = metadata !{i32 1422, i32 0, metadata !142, metadata !1655}
!1655 = metadata !{i32 366, i32 0, metadata !593, null}
!1656 = metadata !{i32 1423, i32 0, metadata !349, metadata !1655}
!1657 = metadata !{i32 1424, i32 0, metadata !349, metadata !1655}
!1658 = metadata !{i32 370, i32 0, metadata !593, null}
!1659 = metadata !{i32 371, i32 0, metadata !593, null}
!1660 = metadata !{i32 372, i32 0, metadata !593, null}
!1661 = metadata !{i32 374, i32 0, metadata !593, null}
!1662 = metadata !{i32 376, i32 0, metadata !593, null}
!1663 = metadata !{i32 377, i32 0, metadata !593, null}
!1664 = metadata !{i32 378, i32 0, metadata !593, null}
!1665 = metadata !{i32 381, i32 0, metadata !593, null}
!1666 = metadata !{i32 383, i32 0, metadata !593, null}
!1667 = metadata !{i32 382, i32 0, metadata !593, null}
!1668 = metadata !{i32 386, i32 0, metadata !591, null}
!1669 = metadata !{i32 387, i32 0, metadata !591, null}
!1670 = metadata !{i32 391, i32 0, metadata !591, null}
!1671 = metadata !{i32 392, i32 0, metadata !591, null}
!1672 = metadata !{i32 395, i32 0, metadata !591, null}
!1673 = metadata !{i32 396, i32 0, metadata !591, null}
!1674 = metadata !{i32 398, i32 0, metadata !591, null}
!1675 = metadata !{i32 342, i32 0, metadata !591, null}
!1676 = metadata !{i32 680, i32 0, metadata !261, null}
!1677 = metadata !{i32 63, i32 0, metadata !59, metadata !1678}
!1678 = metadata !{i32 683, i32 0, metadata !599, null}
!1679 = metadata !{i32 64, i32 0, metadata !276, metadata !1678}
!1680 = metadata !{i32 65, i32 0, metadata !275, metadata !1678}
!1681 = metadata !{i32 66, i32 0, metadata !275, metadata !1678}
!1682 = metadata !{i32 685, i32 0, metadata !599, null}
!1683 = metadata !{i32 686, i32 0, metadata !599, null}
!1684 = metadata !{i32 687, i32 0, metadata !599, null}
!1685 = metadata !{i32 690, i32 0, metadata !599, null}
!1686 = metadata !{i32 691, i32 0, metadata !599, null}
!1687 = metadata !{i32 692, i32 0, metadata !599, null}
!1688 = metadata !{i32 693, i32 0, metadata !599, null}
!1689 = metadata !{i32 694, i32 0, metadata !599, null}
!1690 = metadata !{i32 697, i32 0, metadata !599, null}
!1691 = metadata !{i32 645, i32 0, metadata !258, metadata !1692}
!1692 = metadata !{i32 698, i32 0, metadata !599, null}
!1693 = metadata !{i32 646, i32 0, metadata !1694, metadata !1692}
!1694 = metadata !{i32 589835, metadata !258, i32 645, i32 0, metadata !1, i32 84} ; [ DW_TAG_lexical_block ]
!1695 = metadata !{i32 647, i32 0, metadata !1694, metadata !1692}
!1696 = metadata !{i32 648, i32 0, metadata !1694, metadata !1692}
!1697 = metadata !{i32 649, i32 0, metadata !1694, metadata !1692}
!1698 = metadata !{i32 651, i32 0, metadata !1694, metadata !1692}
!1699 = metadata !{i32 653, i32 0, metadata !1694, metadata !1692}
!1700 = metadata !{i32 654, i32 0, metadata !1694, metadata !1692}
!1701 = metadata !{i32 700, i32 0, metadata !601, null}
!1702 = metadata !{i32 701, i32 0, metadata !601, null}
!1703 = metadata !{i32 702, i32 0, metadata !601, null}
!1704 = metadata !{i32 658, i32 0, metadata !264, null}
!1705 = metadata !{i32 39, i32 0, metadata !0, metadata !1706}
!1706 = metadata !{i32 661, i32 0, metadata !605, null}
!1707 = metadata !{i32 40, i32 0, metadata !269, metadata !1706}
!1708 = metadata !{i32 43, i32 0, metadata !269, metadata !1706}
!1709 = metadata !{i32 46, i32 0, metadata !269, metadata !1706}
!1710 = metadata !{i32 47, i32 0, metadata !269, metadata !1706}
!1711 = metadata !{i32 48, i32 0, metadata !272, metadata !1706}
!1712 = metadata !{i32 49, i32 0, metadata !272, metadata !1706}
!1713 = metadata !{i32 51, i32 0, metadata !272, metadata !1706}
!1714 = metadata !{i32 663, i32 0, metadata !605, null}
!1715 = metadata !{i32 664, i32 0, metadata !605, null}
!1716 = metadata !{i32 665, i32 0, metadata !605, null}
!1717 = metadata !{i32 666, i32 0, metadata !605, null}
!1718 = metadata !{i32 667, i32 0, metadata !605, null}
!1719 = metadata !{i32 670, i32 0, metadata !605, null}
!1720 = metadata !{i32 645, i32 0, metadata !258, metadata !1721}
!1721 = metadata !{i32 671, i32 0, metadata !605, null}
!1722 = metadata !{i32 646, i32 0, metadata !1694, metadata !1721}
!1723 = metadata !{i32 647, i32 0, metadata !1694, metadata !1721}
!1724 = metadata !{i32 648, i32 0, metadata !1694, metadata !1721}
!1725 = metadata !{i32 649, i32 0, metadata !1694, metadata !1721}
!1726 = metadata !{i32 651, i32 0, metadata !1694, metadata !1721}
!1727 = metadata !{i32 653, i32 0, metadata !1694, metadata !1721}
!1728 = metadata !{i32 654, i32 0, metadata !1694, metadata !1721}
!1729 = metadata !{i32 1428, i32 0, metadata !148, metadata !1730}
!1730 = metadata !{i32 673, i32 0, metadata !607, null}
!1731 = metadata !{i32 1415, i32 0, metadata !138, metadata !1732}
!1732 = metadata !{i32 1429, i32 0, metadata !356, metadata !1730}
!1733 = metadata !{i32 1417, i32 0, metadata !346, metadata !1732}
!1734 = metadata !{i32 1418, i32 0, metadata !346, metadata !1732}
!1735 = metadata !{i32 1432, i32 0, metadata !356, metadata !1730}
!1736 = metadata !{i32 1433, i32 0, metadata !359, metadata !1730}
!1737 = metadata !{i32 1434, i32 0, metadata !359, metadata !1730}
!1738 = metadata !{i32 1436, i32 0, metadata !359, metadata !1730}
!1739 = metadata !{i32 1439, i32 0, metadata !359, metadata !1730}
!1740 = metadata !{i32 1442, i32 0, metadata !361, metadata !1730}
!1741 = metadata !{i32 1443, i32 0, metadata !361, metadata !1730}
!1742 = metadata !{i32 1444, i32 0, metadata !361, metadata !1730}
!1743 = metadata !{i32 1445, i32 0, metadata !361, metadata !1730}
!1744 = metadata !{i32 674, i32 0, metadata !607, null}
!1745 = metadata !{i32 675, i32 0, metadata !607, null}
