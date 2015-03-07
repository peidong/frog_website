; ModuleID = 'fd_32.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-f128:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__fsid_t = type { [2 x i32] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.statfs = type { i64, i64, i64, i64, i64, i64, i64, %struct.__fsid_t, i64, i64, i64, [4 x i64] }
%struct.timespec = type { i64, i64 }

@__getdents = alias i64 (i32, %struct.dirent*, i64)* @getdents

define i32 @open(i8* %pathname, i32 %flags, ...) nounwind {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 8
  call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !172), !dbg !245
  call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !173), !dbg !245
  call void @llvm.dbg.value(metadata !246, i64 0, metadata !174), !dbg !247
  %0 = and i32 %flags, 64, !dbg !248
  %1 = icmp eq i32 %0, 0, !dbg !248
  br i1 %1, label %bb8, label %bb, !dbg !248

bb:                                               ; preds = %entry
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !176), !dbg !249
  %ap12 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !250
  call void @llvm.va_start(i8* %ap12), !dbg !250
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !251
  %3 = load i32* %2, align 8, !dbg !251
  %4 = icmp ugt i32 %3, 47, !dbg !251
  br i1 %4, label %bb4, label %bb3, !dbg !251

bb3:                                              ; preds = %bb
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !251
  %6 = load i8** %5, align 8, !dbg !251
  %tmp = zext i32 %3 to i64
  %7 = ptrtoint i8* %6 to i64, !dbg !251
  %8 = add i64 %7, %tmp, !dbg !251
  %9 = inttoptr i64 %8 to i8*, !dbg !251
  %10 = add i32 %3, 8, !dbg !251
  store i32 %10, i32* %2, align 8, !dbg !251
  br label %bb5, !dbg !251

bb4:                                              ; preds = %bb
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !251
  %12 = load i8** %11, align 8, !dbg !251
  %13 = getelementptr inbounds i8* %12, i64 8, !dbg !251
  store i8* %13, i8** %11, align 8, !dbg !251
  br label %bb5, !dbg !251

bb5:                                              ; preds = %bb4, %bb3
  %addr.24.0 = phi i8* [ %12, %bb4 ], [ %9, %bb3 ]
  %14 = bitcast i8* %addr.24.0 to i32*, !dbg !251
  %15 = load i32* %14, align 4, !dbg !251
  call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !174), !dbg !251
  call void @llvm.va_end(i8* %ap12), !dbg !252
  br label %bb8, !dbg !252

bb8:                                              ; preds = %entry, %bb5
  %mode.0 = phi i32 [ %15, %bb5 ], [ 0, %entry ]
  %16 = call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode.0) nounwind, !dbg !253
  ret i32 %16, !dbg !253
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak i32 @open64(i8* %pathname, i32 %flags, ...) nounwind {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 8
  call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !152), !dbg !254
  call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !153), !dbg !254
  call void @llvm.dbg.value(metadata !246, i64 0, metadata !154), !dbg !255
  %0 = and i32 %flags, 64, !dbg !256
  %1 = icmp eq i32 %0, 0, !dbg !256
  br i1 %1, label %bb8, label %bb, !dbg !256

bb:                                               ; preds = %entry
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !157), !dbg !257
  %ap12 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !258
  call void @llvm.va_start(i8* %ap12), !dbg !258
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !259
  %3 = load i32* %2, align 8, !dbg !259
  %4 = icmp ugt i32 %3, 47, !dbg !259
  br i1 %4, label %bb4, label %bb3, !dbg !259

bb3:                                              ; preds = %bb
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !259
  %6 = load i8** %5, align 8, !dbg !259
  %tmp = zext i32 %3 to i64
  %7 = ptrtoint i8* %6 to i64, !dbg !259
  %8 = add i64 %7, %tmp, !dbg !259
  %9 = inttoptr i64 %8 to i8*, !dbg !259
  %10 = add i32 %3, 8, !dbg !259
  store i32 %10, i32* %2, align 8, !dbg !259
  br label %bb5, !dbg !259

bb4:                                              ; preds = %bb
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !259
  %12 = load i8** %11, align 8, !dbg !259
  %13 = getelementptr inbounds i8* %12, i64 8, !dbg !259
  store i8* %13, i8** %11, align 8, !dbg !259
  br label %bb5, !dbg !259

bb5:                                              ; preds = %bb4, %bb3
  %addr.31.0 = phi i8* [ %12, %bb4 ], [ %9, %bb3 ]
  %14 = bitcast i8* %addr.31.0 to i32*, !dbg !259
  %15 = load i32* %14, align 4, !dbg !259
  call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !154), !dbg !259
  call void @llvm.va_end(i8* %ap12), !dbg !260
  br label %bb8, !dbg !260

bb8:                                              ; preds = %entry, %bb5
  %mode.0 = phi i32 [ %15, %bb5 ], [ 0, %entry ]
  %16 = call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode.0) nounwind, !dbg !261
  ret i32 %16, !dbg !261
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

declare i32 @__fd_open(i8*, i32, i32)

define i64 @getdents(i32 %fd, %struct.dirent* %dirp, i64 %nbytes) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !178), !dbg !262
  tail call void @llvm.dbg.value(metadata !{%struct.dirent* %dirp}, i64 0, metadata !179), !dbg !262
  tail call void @llvm.dbg.value(metadata !{i64 %nbytes}, i64 0, metadata !180), !dbg !262
  tail call void @llvm.dbg.value(metadata !{%struct.dirent* %dirp}, i64 0, metadata !181), !dbg !263
  %0 = trunc i64 %nbytes to i32, !dbg !264
  %1 = tail call i32 @__fd_getdents(i32 %fd, %struct.dirent* %dirp, i32 %0) nounwind, !dbg !264
  %2 = sext i32 %1 to i64, !dbg !264
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !192), !dbg !264
  %3 = icmp sgt i32 %1, 0, !dbg !265
  br i1 %3, label %bb, label %bb3, !dbg !265

bb:                                               ; preds = %entry
  %4 = bitcast %struct.dirent* %dirp to i8*, !dbg !266
  %5 = getelementptr inbounds i8* %4, i64 %2, !dbg !266
  %6 = bitcast i8* %5 to %struct.dirent*, !dbg !266
  tail call void @llvm.dbg.value(metadata !{%struct.dirent* %6}, i64 0, metadata !193), !dbg !266
  %7 = icmp ugt %struct.dirent* %6, %dirp, !dbg !267
  br i1 %7, label %bb1, label %bb3, !dbg !267

bb1:                                              ; preds = %bb, %bb1
  %dp64.05 = phi %struct.dirent* [ %13, %bb1 ], [ %dirp, %bb ]
  %8 = getelementptr inbounds %struct.dirent* %dp64.05, i64 0, i32 2, !dbg !268
  %9 = bitcast %struct.dirent* %dp64.05 to i8*, !dbg !269
  %10 = load i16* %8, align 8, !dbg !269
  %11 = zext i16 %10 to i64, !dbg !269
  %12 = getelementptr inbounds i8* %9, i64 %11, !dbg !269
  %13 = bitcast i8* %12 to %struct.dirent*, !dbg !269
  %14 = icmp ult i8* %12, %5, !dbg !267
  br i1 %14, label %bb1, label %bb3, !dbg !267

bb3:                                              ; preds = %bb, %bb1, %entry
  ret i64 %2, !dbg !270
}

declare i32 @__fd_getdents(i32, %struct.dirent*, i32)

define i32 @statfs(i8* %path, %struct.statfs* %buf32) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !198), !dbg !271
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf32}, i64 0, metadata !199), !dbg !271
  %0 = tail call i32 @__fd_statfs(i8* %path, %struct.statfs* %buf32) nounwind, !dbg !272
  ret i32 %0, !dbg !272
}

declare i32 @__fd_statfs(i8*, %struct.statfs*)

define i32 @ftruncate(i32 %fd, i64 %length) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !200), !dbg !274
  tail call void @llvm.dbg.value(metadata !{i64 %length}, i64 0, metadata !201), !dbg !274
  %0 = tail call i32 @__fd_ftruncate(i32 %fd, i64 %length) nounwind, !dbg !275
  ret i32 %0, !dbg !275
}

declare i32 @__fd_ftruncate(i32, i64)

define i32 @fstat(i32 %fd, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat, align 8
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !202), !dbg !277
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !203), !dbg !277
  call void @llvm.dbg.declare(metadata !{%struct.stat* %tmp}, metadata !204), !dbg !278
  %0 = call i32 @__fd_fstat(i32 %fd, %struct.stat* %tmp) nounwind, !dbg !279
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !206), !dbg !279
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %tmp}, i64 0, metadata !150), !dbg !280
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !151), !dbg !280
  %1 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 0, !dbg !282
  %2 = load i64* %1, align 8, !dbg !282
  %3 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 0, !dbg !282
  store i64 %2, i64* %3, align 8, !dbg !282
  %4 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 1, !dbg !284
  %5 = load i64* %4, align 8, !dbg !284
  %6 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 1, !dbg !284
  store i64 %5, i64* %6, align 8, !dbg !284
  %7 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 3, !dbg !285
  %8 = load i32* %7, align 8, !dbg !285
  %9 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !285
  store i32 %8, i32* %9, align 8, !dbg !285
  %10 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 2, !dbg !286
  %11 = load i64* %10, align 8, !dbg !286
  %12 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !286
  store i64 %11, i64* %12, align 8, !dbg !286
  %13 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 4, !dbg !287
  %14 = load i32* %13, align 4, !dbg !287
  %15 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !287
  store i32 %14, i32* %15, align 4, !dbg !287
  %16 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 5, !dbg !288
  %17 = load i32* %16, align 8, !dbg !288
  %18 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !288
  store i32 %17, i32* %18, align 8, !dbg !288
  %19 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 7, !dbg !289
  %20 = load i64* %19, align 8, !dbg !289
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !289
  store i64 %20, i64* %21, align 8, !dbg !289
  %22 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 8, !dbg !290
  %23 = load i64* %22, align 8, !dbg !290
  %24 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 8, !dbg !290
  store i64 %23, i64* %24, align 8, !dbg !290
  %25 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 11, i32 0, !dbg !291
  %26 = load i64* %25, align 8, !dbg !291
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0, !dbg !291
  store i64 %26, i64* %27, align 8, !dbg !291
  %28 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 12, i32 0, !dbg !292
  %29 = load i64* %28, align 8, !dbg !292
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0, !dbg !292
  store i64 %29, i64* %30, align 8, !dbg !292
  %31 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 13, i32 0, !dbg !293
  %32 = load i64* %31, align 8, !dbg !293
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0, !dbg !293
  store i64 %32, i64* %33, align 8, !dbg !293
  %34 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 9, !dbg !294
  %35 = load i64* %34, align 8, !dbg !294
  %36 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !294
  store i64 %35, i64* %36, align 8, !dbg !294
  %37 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 10, !dbg !295
  %38 = load i64* %37, align 8, !dbg !295
  %39 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 10, !dbg !295
  store i64 %38, i64* %39, align 8, !dbg !295
  %40 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 11, i32 1, !dbg !296
  %41 = load i64* %40, align 8, !dbg !296
  %42 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 1, !dbg !296
  store i64 %41, i64* %42, align 8, !dbg !296
  %43 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 12, i32 1, !dbg !297
  %44 = load i64* %43, align 8, !dbg !297
  %45 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 1, !dbg !297
  store i64 %44, i64* %45, align 8, !dbg !297
  %46 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 13, i32 1, !dbg !298
  %47 = load i64* %46, align 8, !dbg !298
  %48 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 1, !dbg !298
  store i64 %47, i64* %48, align 8, !dbg !298
  ret i32 %0, !dbg !299
}

declare i32 @__fd_fstat(i32, %struct.stat*)

define i32 @__fxstat(i32 %vers, i32 %fd, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat, align 8
  call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !207), !dbg !300
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !208), !dbg !300
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !209), !dbg !300
  call void @llvm.dbg.declare(metadata !{%struct.stat* %tmp}, metadata !210), !dbg !301
  %0 = call i32 @__fd_fstat(i32 %fd, %struct.stat* %tmp) nounwind, !dbg !302
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !212), !dbg !302
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %tmp}, i64 0, metadata !150), !dbg !303
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !151), !dbg !303
  %1 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 0, !dbg !305
  %2 = load i64* %1, align 8, !dbg !305
  %3 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 0, !dbg !305
  store i64 %2, i64* %3, align 8, !dbg !305
  %4 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 1, !dbg !306
  %5 = load i64* %4, align 8, !dbg !306
  %6 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 1, !dbg !306
  store i64 %5, i64* %6, align 8, !dbg !306
  %7 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 3, !dbg !307
  %8 = load i32* %7, align 8, !dbg !307
  %9 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !307
  store i32 %8, i32* %9, align 8, !dbg !307
  %10 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 2, !dbg !308
  %11 = load i64* %10, align 8, !dbg !308
  %12 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !308
  store i64 %11, i64* %12, align 8, !dbg !308
  %13 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 4, !dbg !309
  %14 = load i32* %13, align 4, !dbg !309
  %15 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !309
  store i32 %14, i32* %15, align 4, !dbg !309
  %16 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 5, !dbg !310
  %17 = load i32* %16, align 8, !dbg !310
  %18 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !310
  store i32 %17, i32* %18, align 8, !dbg !310
  %19 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 7, !dbg !311
  %20 = load i64* %19, align 8, !dbg !311
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !311
  store i64 %20, i64* %21, align 8, !dbg !311
  %22 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 8, !dbg !312
  %23 = load i64* %22, align 8, !dbg !312
  %24 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 8, !dbg !312
  store i64 %23, i64* %24, align 8, !dbg !312
  %25 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 11, i32 0, !dbg !313
  %26 = load i64* %25, align 8, !dbg !313
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0, !dbg !313
  store i64 %26, i64* %27, align 8, !dbg !313
  %28 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 12, i32 0, !dbg !314
  %29 = load i64* %28, align 8, !dbg !314
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0, !dbg !314
  store i64 %29, i64* %30, align 8, !dbg !314
  %31 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 13, i32 0, !dbg !315
  %32 = load i64* %31, align 8, !dbg !315
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0, !dbg !315
  store i64 %32, i64* %33, align 8, !dbg !315
  %34 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 9, !dbg !316
  %35 = load i64* %34, align 8, !dbg !316
  %36 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !316
  store i64 %35, i64* %36, align 8, !dbg !316
  %37 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 10, !dbg !317
  %38 = load i64* %37, align 8, !dbg !317
  %39 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 10, !dbg !317
  store i64 %38, i64* %39, align 8, !dbg !317
  %40 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 11, i32 1, !dbg !318
  %41 = load i64* %40, align 8, !dbg !318
  %42 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 1, !dbg !318
  store i64 %41, i64* %42, align 8, !dbg !318
  %43 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 12, i32 1, !dbg !319
  %44 = load i64* %43, align 8, !dbg !319
  %45 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 1, !dbg !319
  store i64 %44, i64* %45, align 8, !dbg !319
  %46 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 13, i32 1, !dbg !320
  %47 = load i64* %46, align 8, !dbg !320
  %48 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 1, !dbg !320
  store i64 %47, i64* %48, align 8, !dbg !320
  ret i32 %0, !dbg !321
}

define i32 @lstat(i8* %path, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat, align 8
  call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !213), !dbg !322
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !214), !dbg !322
  call void @llvm.dbg.declare(metadata !{%struct.stat* %tmp}, metadata !215), !dbg !323
  %0 = call i32 @__fd_lstat(i8* %path, %struct.stat* %tmp) nounwind, !dbg !324
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !217), !dbg !324
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %tmp}, i64 0, metadata !150), !dbg !325
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !151), !dbg !325
  %1 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 0, !dbg !327
  %2 = load i64* %1, align 8, !dbg !327
  %3 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 0, !dbg !327
  store i64 %2, i64* %3, align 8, !dbg !327
  %4 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 1, !dbg !328
  %5 = load i64* %4, align 8, !dbg !328
  %6 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 1, !dbg !328
  store i64 %5, i64* %6, align 8, !dbg !328
  %7 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 3, !dbg !329
  %8 = load i32* %7, align 8, !dbg !329
  %9 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !329
  store i32 %8, i32* %9, align 8, !dbg !329
  %10 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 2, !dbg !330
  %11 = load i64* %10, align 8, !dbg !330
  %12 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !330
  store i64 %11, i64* %12, align 8, !dbg !330
  %13 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 4, !dbg !331
  %14 = load i32* %13, align 4, !dbg !331
  %15 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !331
  store i32 %14, i32* %15, align 4, !dbg !331
  %16 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 5, !dbg !332
  %17 = load i32* %16, align 8, !dbg !332
  %18 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !332
  store i32 %17, i32* %18, align 8, !dbg !332
  %19 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 7, !dbg !333
  %20 = load i64* %19, align 8, !dbg !333
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !333
  store i64 %20, i64* %21, align 8, !dbg !333
  %22 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 8, !dbg !334
  %23 = load i64* %22, align 8, !dbg !334
  %24 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 8, !dbg !334
  store i64 %23, i64* %24, align 8, !dbg !334
  %25 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 11, i32 0, !dbg !335
  %26 = load i64* %25, align 8, !dbg !335
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0, !dbg !335
  store i64 %26, i64* %27, align 8, !dbg !335
  %28 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 12, i32 0, !dbg !336
  %29 = load i64* %28, align 8, !dbg !336
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0, !dbg !336
  store i64 %29, i64* %30, align 8, !dbg !336
  %31 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 13, i32 0, !dbg !337
  %32 = load i64* %31, align 8, !dbg !337
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0, !dbg !337
  store i64 %32, i64* %33, align 8, !dbg !337
  %34 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 9, !dbg !338
  %35 = load i64* %34, align 8, !dbg !338
  %36 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !338
  store i64 %35, i64* %36, align 8, !dbg !338
  %37 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 10, !dbg !339
  %38 = load i64* %37, align 8, !dbg !339
  %39 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 10, !dbg !339
  store i64 %38, i64* %39, align 8, !dbg !339
  %40 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 11, i32 1, !dbg !340
  %41 = load i64* %40, align 8, !dbg !340
  %42 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 1, !dbg !340
  store i64 %41, i64* %42, align 8, !dbg !340
  %43 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 12, i32 1, !dbg !341
  %44 = load i64* %43, align 8, !dbg !341
  %45 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 1, !dbg !341
  store i64 %44, i64* %45, align 8, !dbg !341
  %46 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 13, i32 1, !dbg !342
  %47 = load i64* %46, align 8, !dbg !342
  %48 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 1, !dbg !342
  store i64 %47, i64* %48, align 8, !dbg !342
  ret i32 %0, !dbg !343
}

declare i32 @__fd_lstat(i8*, %struct.stat*)

define i32 @__lxstat(i32 %vers, i8* %path, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat, align 8
  call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !218), !dbg !344
  call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !219), !dbg !344
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !220), !dbg !344
  call void @llvm.dbg.declare(metadata !{%struct.stat* %tmp}, metadata !221), !dbg !345
  %0 = call i32 @__fd_lstat(i8* %path, %struct.stat* %tmp) nounwind, !dbg !346
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !223), !dbg !346
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %tmp}, i64 0, metadata !150), !dbg !347
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !151), !dbg !347
  %1 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 0, !dbg !349
  %2 = load i64* %1, align 8, !dbg !349
  %3 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 0, !dbg !349
  store i64 %2, i64* %3, align 8, !dbg !349
  %4 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 1, !dbg !350
  %5 = load i64* %4, align 8, !dbg !350
  %6 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 1, !dbg !350
  store i64 %5, i64* %6, align 8, !dbg !350
  %7 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 3, !dbg !351
  %8 = load i32* %7, align 8, !dbg !351
  %9 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !351
  store i32 %8, i32* %9, align 8, !dbg !351
  %10 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 2, !dbg !352
  %11 = load i64* %10, align 8, !dbg !352
  %12 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !352
  store i64 %11, i64* %12, align 8, !dbg !352
  %13 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 4, !dbg !353
  %14 = load i32* %13, align 4, !dbg !353
  %15 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !353
  store i32 %14, i32* %15, align 4, !dbg !353
  %16 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 5, !dbg !354
  %17 = load i32* %16, align 8, !dbg !354
  %18 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !354
  store i32 %17, i32* %18, align 8, !dbg !354
  %19 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 7, !dbg !355
  %20 = load i64* %19, align 8, !dbg !355
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !355
  store i64 %20, i64* %21, align 8, !dbg !355
  %22 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 8, !dbg !356
  %23 = load i64* %22, align 8, !dbg !356
  %24 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 8, !dbg !356
  store i64 %23, i64* %24, align 8, !dbg !356
  %25 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 11, i32 0, !dbg !357
  %26 = load i64* %25, align 8, !dbg !357
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0, !dbg !357
  store i64 %26, i64* %27, align 8, !dbg !357
  %28 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 12, i32 0, !dbg !358
  %29 = load i64* %28, align 8, !dbg !358
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0, !dbg !358
  store i64 %29, i64* %30, align 8, !dbg !358
  %31 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 13, i32 0, !dbg !359
  %32 = load i64* %31, align 8, !dbg !359
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0, !dbg !359
  store i64 %32, i64* %33, align 8, !dbg !359
  %34 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 9, !dbg !360
  %35 = load i64* %34, align 8, !dbg !360
  %36 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !360
  store i64 %35, i64* %36, align 8, !dbg !360
  %37 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 10, !dbg !361
  %38 = load i64* %37, align 8, !dbg !361
  %39 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 10, !dbg !361
  store i64 %38, i64* %39, align 8, !dbg !361
  %40 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 11, i32 1, !dbg !362
  %41 = load i64* %40, align 8, !dbg !362
  %42 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 1, !dbg !362
  store i64 %41, i64* %42, align 8, !dbg !362
  %43 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 12, i32 1, !dbg !363
  %44 = load i64* %43, align 8, !dbg !363
  %45 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 1, !dbg !363
  store i64 %44, i64* %45, align 8, !dbg !363
  %46 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 13, i32 1, !dbg !364
  %47 = load i64* %46, align 8, !dbg !364
  %48 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 1, !dbg !364
  store i64 %47, i64* %48, align 8, !dbg !364
  ret i32 %0, !dbg !365
}

define i32 @stat(i8* %path, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat, align 8
  call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !224), !dbg !366
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !225), !dbg !366
  call void @llvm.dbg.declare(metadata !{%struct.stat* %tmp}, metadata !226), !dbg !367
  %0 = call i32 @__fd_stat(i8* %path, %struct.stat* %tmp) nounwind, !dbg !368
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !228), !dbg !368
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %tmp}, i64 0, metadata !150), !dbg !369
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !151), !dbg !369
  %1 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 0, !dbg !371
  %2 = load i64* %1, align 8, !dbg !371
  %3 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 0, !dbg !371
  store i64 %2, i64* %3, align 8, !dbg !371
  %4 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 1, !dbg !372
  %5 = load i64* %4, align 8, !dbg !372
  %6 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 1, !dbg !372
  store i64 %5, i64* %6, align 8, !dbg !372
  %7 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 3, !dbg !373
  %8 = load i32* %7, align 8, !dbg !373
  %9 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !373
  store i32 %8, i32* %9, align 8, !dbg !373
  %10 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 2, !dbg !374
  %11 = load i64* %10, align 8, !dbg !374
  %12 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !374
  store i64 %11, i64* %12, align 8, !dbg !374
  %13 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 4, !dbg !375
  %14 = load i32* %13, align 4, !dbg !375
  %15 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !375
  store i32 %14, i32* %15, align 4, !dbg !375
  %16 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 5, !dbg !376
  %17 = load i32* %16, align 8, !dbg !376
  %18 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !376
  store i32 %17, i32* %18, align 8, !dbg !376
  %19 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 7, !dbg !377
  %20 = load i64* %19, align 8, !dbg !377
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !377
  store i64 %20, i64* %21, align 8, !dbg !377
  %22 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 8, !dbg !378
  %23 = load i64* %22, align 8, !dbg !378
  %24 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 8, !dbg !378
  store i64 %23, i64* %24, align 8, !dbg !378
  %25 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 11, i32 0, !dbg !379
  %26 = load i64* %25, align 8, !dbg !379
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0, !dbg !379
  store i64 %26, i64* %27, align 8, !dbg !379
  %28 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 12, i32 0, !dbg !380
  %29 = load i64* %28, align 8, !dbg !380
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0, !dbg !380
  store i64 %29, i64* %30, align 8, !dbg !380
  %31 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 13, i32 0, !dbg !381
  %32 = load i64* %31, align 8, !dbg !381
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0, !dbg !381
  store i64 %32, i64* %33, align 8, !dbg !381
  %34 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 9, !dbg !382
  %35 = load i64* %34, align 8, !dbg !382
  %36 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !382
  store i64 %35, i64* %36, align 8, !dbg !382
  %37 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 10, !dbg !383
  %38 = load i64* %37, align 8, !dbg !383
  %39 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 10, !dbg !383
  store i64 %38, i64* %39, align 8, !dbg !383
  %40 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 11, i32 1, !dbg !384
  %41 = load i64* %40, align 8, !dbg !384
  %42 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 1, !dbg !384
  store i64 %41, i64* %42, align 8, !dbg !384
  %43 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 12, i32 1, !dbg !385
  %44 = load i64* %43, align 8, !dbg !385
  %45 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 1, !dbg !385
  store i64 %44, i64* %45, align 8, !dbg !385
  %46 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 13, i32 1, !dbg !386
  %47 = load i64* %46, align 8, !dbg !386
  %48 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 1, !dbg !386
  store i64 %47, i64* %48, align 8, !dbg !386
  ret i32 %0, !dbg !387
}

declare i32 @__fd_stat(i8*, %struct.stat*)

define i32 @__xstat(i32 %vers, i8* %path, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat, align 8
  call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !229), !dbg !388
  call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !230), !dbg !388
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !231), !dbg !388
  call void @llvm.dbg.declare(metadata !{%struct.stat* %tmp}, metadata !232), !dbg !389
  %0 = call i32 @__fd_stat(i8* %path, %struct.stat* %tmp) nounwind, !dbg !390
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !234), !dbg !390
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %tmp}, i64 0, metadata !150), !dbg !391
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !151), !dbg !391
  %1 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 0, !dbg !393
  %2 = load i64* %1, align 8, !dbg !393
  %3 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 0, !dbg !393
  store i64 %2, i64* %3, align 8, !dbg !393
  %4 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 1, !dbg !394
  %5 = load i64* %4, align 8, !dbg !394
  %6 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 1, !dbg !394
  store i64 %5, i64* %6, align 8, !dbg !394
  %7 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 3, !dbg !395
  %8 = load i32* %7, align 8, !dbg !395
  %9 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !395
  store i32 %8, i32* %9, align 8, !dbg !395
  %10 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 2, !dbg !396
  %11 = load i64* %10, align 8, !dbg !396
  %12 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !396
  store i64 %11, i64* %12, align 8, !dbg !396
  %13 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 4, !dbg !397
  %14 = load i32* %13, align 4, !dbg !397
  %15 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !397
  store i32 %14, i32* %15, align 4, !dbg !397
  %16 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 5, !dbg !398
  %17 = load i32* %16, align 8, !dbg !398
  %18 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !398
  store i32 %17, i32* %18, align 8, !dbg !398
  %19 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 7, !dbg !399
  %20 = load i64* %19, align 8, !dbg !399
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !399
  store i64 %20, i64* %21, align 8, !dbg !399
  %22 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 8, !dbg !400
  %23 = load i64* %22, align 8, !dbg !400
  %24 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 8, !dbg !400
  store i64 %23, i64* %24, align 8, !dbg !400
  %25 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 11, i32 0, !dbg !401
  %26 = load i64* %25, align 8, !dbg !401
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0, !dbg !401
  store i64 %26, i64* %27, align 8, !dbg !401
  %28 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 12, i32 0, !dbg !402
  %29 = load i64* %28, align 8, !dbg !402
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0, !dbg !402
  store i64 %29, i64* %30, align 8, !dbg !402
  %31 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 13, i32 0, !dbg !403
  %32 = load i64* %31, align 8, !dbg !403
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0, !dbg !403
  store i64 %32, i64* %33, align 8, !dbg !403
  %34 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 9, !dbg !404
  %35 = load i64* %34, align 8, !dbg !404
  %36 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !404
  store i64 %35, i64* %36, align 8, !dbg !404
  %37 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 10, !dbg !405
  %38 = load i64* %37, align 8, !dbg !405
  %39 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 10, !dbg !405
  store i64 %38, i64* %39, align 8, !dbg !405
  %40 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 11, i32 1, !dbg !406
  %41 = load i64* %40, align 8, !dbg !406
  %42 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 1, !dbg !406
  store i64 %41, i64* %42, align 8, !dbg !406
  %43 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 12, i32 1, !dbg !407
  %44 = load i64* %43, align 8, !dbg !407
  %45 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 1, !dbg !407
  store i64 %44, i64* %45, align 8, !dbg !407
  %46 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 13, i32 1, !dbg !408
  %47 = load i64* %46, align 8, !dbg !408
  %48 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 1, !dbg !408
  store i64 %47, i64* %48, align 8, !dbg !408
  ret i32 %0, !dbg !409
}

define i64 @lseek(i32 %fd, i64 %off, i32 %whence) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !410
  tail call void @llvm.dbg.value(metadata !{i64 %off}, i64 0, metadata !236), !dbg !410
  tail call void @llvm.dbg.value(metadata !{i32 %whence}, i64 0, metadata !237), !dbg !410
  %0 = tail call i64 @__fd_lseek(i32 %fd, i64 %off, i32 %whence) nounwind, !dbg !411
  ret i64 %0, !dbg !411
}

declare i64 @__fd_lseek(i32, i64, i32)

define i32 @openat(i32 %fd, i8* %pathname, i32 %flags, ...) nounwind {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 8
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !238), !dbg !413
  call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !239), !dbg !413
  call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !240), !dbg !413
  call void @llvm.dbg.value(metadata !246, i64 0, metadata !241), !dbg !414
  %0 = and i32 %flags, 64, !dbg !415
  %1 = icmp eq i32 %0, 0, !dbg !415
  br i1 %1, label %bb8, label %bb, !dbg !415

bb:                                               ; preds = %entry
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !243), !dbg !416
  %ap12 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !417
  call void @llvm.va_start(i8* %ap12), !dbg !417
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !418
  %3 = load i32* %2, align 8, !dbg !418
  %4 = icmp ugt i32 %3, 47, !dbg !418
  br i1 %4, label %bb4, label %bb3, !dbg !418

bb3:                                              ; preds = %bb
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !418
  %6 = load i8** %5, align 8, !dbg !418
  %tmp = zext i32 %3 to i64
  %7 = ptrtoint i8* %6 to i64, !dbg !418
  %8 = add i64 %7, %tmp, !dbg !418
  %9 = inttoptr i64 %8 to i8*, !dbg !418
  %10 = add i32 %3, 8, !dbg !418
  store i32 %10, i32* %2, align 8, !dbg !418
  br label %bb5, !dbg !418

bb4:                                              ; preds = %bb
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !418
  %12 = load i8** %11, align 8, !dbg !418
  %13 = getelementptr inbounds i8* %12, i64 8, !dbg !418
  store i8* %13, i8** %11, align 8, !dbg !418
  br label %bb5, !dbg !418

bb5:                                              ; preds = %bb4, %bb3
  %addr.26.0 = phi i8* [ %12, %bb4 ], [ %9, %bb3 ]
  %14 = bitcast i8* %addr.26.0 to i32*, !dbg !418
  %15 = load i32* %14, align 4, !dbg !418
  call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !241), !dbg !418
  call void @llvm.va_end(i8* %ap12), !dbg !419
  br label %bb8, !dbg !419

bb8:                                              ; preds = %entry, %bb5
  %mode.0 = phi i32 [ %15, %bb5 ], [ 0, %entry ]
  %16 = call i32 @__fd_openat(i32 %fd, i8* %pathname, i32 %flags, i32 %mode.0) nounwind, !dbg !420
  ret i32 %16, !dbg !420
}

declare i32 @__fd_openat(i32, i8*, i32, i32)

!llvm.dbg.sp = !{!0, !68, !74, !75, !95, !126, !130, !133, !136, !139, !142, !143, !144, !147}
!llvm.dbg.lv.__stat64_to_stat = !{!150, !151}
!llvm.dbg.lv.open64 = !{!152, !153, !154, !157}
!llvm.dbg.lv.open = !{!172, !173, !174, !176}
!llvm.dbg.lv.getdents = !{!178, !179, !180, !181, !192, !193, !195, !197}
!llvm.dbg.lv.statfs = !{!198, !199}
!llvm.dbg.lv.ftruncate = !{!200, !201}
!llvm.dbg.lv.fstat = !{!202, !203, !204, !206}
!llvm.dbg.lv.__fxstat = !{!207, !208, !209, !210, !212}
!llvm.dbg.lv.lstat = !{!213, !214, !215, !217}
!llvm.dbg.lv.__lxstat = !{!218, !219, !220, !221, !223}
!llvm.dbg.lv.stat = !{!224, !225, !226, !228}
!llvm.dbg.lv.__xstat = !{!229, !230, !231, !232, !234}
!llvm.dbg.lv.lseek = !{!235, !236, !237}
!llvm.dbg.lv.openat = !{!238, !239, !240, !241, !243}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__stat64_to_stat", metadata !"__stat64_to_stat", metadata !"", metadata !1, i32 41, metadata !3, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"fd_32.c", metadata !"/home/qirong/Frog/frog_test/tools/KLEE_SOURCE_2015/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 1, metadata !"fd_32.c", metadata !"/home/qirong/Frog/frog_test/tools/KLEE_SOURCE_2015/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{null, metadata !5, metadata !48}
!5 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !6} ; [ DW_TAG_pointer_type ]
!6 = metadata !{i32 589843, metadata !1, metadata !"stat64", metadata !7, i32 23, i64 1152, i64 64, i64 0, i32 0, null, metadata !8, i32 0, null} ; [ DW_TAG_structure_type ]
!7 = metadata !{i32 589865, metadata !"fd.h", metadata !"/home/qirong/Frog/frog_test/tools/KLEE_SOURCE_2015/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!8 = metadata !{metadata !9, metadata !14, metadata !16, metadata !18, metadata !21, metadata !23, metadata !25, metadata !27, metadata !28, metadata !31, metadata !33, metadata !35, metadata !42, metadata !43, metadata !44}
!9 = metadata !{i32 589837, metadata !6, metadata !"st_dev", metadata !10, i32 121, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ]
!10 = metadata !{i32 589865, metadata !"stat.h", metadata !"/usr/include/x86_64-linux-gnu/bits", metadata !2} ; [ DW_TAG_file_type ]
!11 = metadata !{i32 589846, metadata !12, metadata !"__dev_t", metadata !12, i32 135, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!12 = metadata !{i32 589865, metadata !"types.h", metadata !"/usr/include/x86_64-linux-gnu/bits", metadata !2} ; [ DW_TAG_file_type ]
!13 = metadata !{i32 589860, metadata !1, metadata !"long unsigned int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!14 = metadata !{i32 589837, metadata !6, metadata !"st_ino", metadata !10, i32 123, i64 64, i64 64, i64 64, i32 0, metadata !15} ; [ DW_TAG_member ]
!15 = metadata !{i32 589846, metadata !12, metadata !"__ino64_t", metadata !12, i32 139, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!16 = metadata !{i32 589837, metadata !6, metadata !"st_nlink", metadata !10, i32 124, i64 64, i64 64, i64 128, i32 0, metadata !17} ; [ DW_TAG_member ]
!17 = metadata !{i32 589846, metadata !12, metadata !"__nlink_t", metadata !12, i32 141, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!18 = metadata !{i32 589837, metadata !6, metadata !"st_mode", metadata !10, i32 125, i64 32, i64 32, i64 192, i32 0, metadata !19} ; [ DW_TAG_member ]
!19 = metadata !{i32 589846, metadata !12, metadata !"__mode_t", metadata !12, i32 140, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ]
!20 = metadata !{i32 589860, metadata !1, metadata !"unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!21 = metadata !{i32 589837, metadata !6, metadata !"st_uid", metadata !10, i32 132, i64 32, i64 32, i64 224, i32 0, metadata !22} ; [ DW_TAG_member ]
!22 = metadata !{i32 589846, metadata !12, metadata !"__uid_t", metadata !12, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ]
!23 = metadata !{i32 589837, metadata !6, metadata !"st_gid", metadata !10, i32 133, i64 32, i64 32, i64 256, i32 0, metadata !24} ; [ DW_TAG_member ]
!24 = metadata !{i32 589846, metadata !12, metadata !"__gid_t", metadata !12, i32 137, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ]
!25 = metadata !{i32 589837, metadata !6, metadata !"__pad0", metadata !10, i32 135, i64 32, i64 32, i64 288, i32 0, metadata !26} ; [ DW_TAG_member ]
!26 = metadata !{i32 589860, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!27 = metadata !{i32 589837, metadata !6, metadata !"st_rdev", metadata !10, i32 136, i64 64, i64 64, i64 320, i32 0, metadata !11} ; [ DW_TAG_member ]
!28 = metadata !{i32 589837, metadata !6, metadata !"st_size", metadata !10, i32 137, i64 64, i64 64, i64 384, i32 0, metadata !29} ; [ DW_TAG_member ]
!29 = metadata !{i32 589846, metadata !12, metadata !"__off_t", metadata !12, i32 142, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!30 = metadata !{i32 589860, metadata !1, metadata !"long int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!31 = metadata !{i32 589837, metadata !6, metadata !"st_blksize", metadata !10, i32 143, i64 64, i64 64, i64 448, i32 0, metadata !32} ; [ DW_TAG_member ]
!32 = metadata !{i32 589846, metadata !12, metadata !"__blksize_t", metadata !12, i32 169, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!33 = metadata !{i32 589837, metadata !6, metadata !"st_blocks", metadata !10, i32 144, i64 64, i64 64, i64 512, i32 0, metadata !34} ; [ DW_TAG_member ]
!34 = metadata !{i32 589846, metadata !12, metadata !"__blkcnt64_t", metadata !12, i32 173, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!35 = metadata !{i32 589837, metadata !6, metadata !"st_atim", metadata !10, i32 152, i64 128, i64 64, i64 576, i32 0, metadata !36} ; [ DW_TAG_member ]
!36 = metadata !{i32 589843, metadata !1, metadata !"timespec", metadata !37, i32 121, i64 128, i64 64, i64 0, i32 0, null, metadata !38, i32 0, null} ; [ DW_TAG_structure_type ]
!37 = metadata !{i32 589865, metadata !"time.h", metadata !"/usr/include", metadata !2} ; [ DW_TAG_file_type ]
!38 = metadata !{metadata !39, metadata !41}
!39 = metadata !{i32 589837, metadata !36, metadata !"tv_sec", metadata !37, i32 122, i64 64, i64 64, i64 0, i32 0, metadata !40} ; [ DW_TAG_member ]
!40 = metadata !{i32 589846, metadata !12, metadata !"__time_t", metadata !12, i32 150, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!41 = metadata !{i32 589837, metadata !36, metadata !"tv_nsec", metadata !37, i32 123, i64 64, i64 64, i64 64, i32 0, metadata !30} ; [ DW_TAG_member ]
!42 = metadata !{i32 589837, metadata !6, metadata !"st_mtim", metadata !10, i32 153, i64 128, i64 64, i64 704, i32 0, metadata !36} ; [ DW_TAG_member ]
!43 = metadata !{i32 589837, metadata !6, metadata !"st_ctim", metadata !10, i32 154, i64 128, i64 64, i64 832, i32 0, metadata !36} ; [ DW_TAG_member ]
!44 = metadata !{i32 589837, metadata !6, metadata !"__unused", metadata !10, i32 167, i64 192, i64 64, i64 960, i32 0, metadata !45} ; [ DW_TAG_member ]
!45 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 192, i64 64, i64 0, i32 0, metadata !30, metadata !46, i32 0, null} ; [ DW_TAG_array_type ]
!46 = metadata !{metadata !47}
!47 = metadata !{i32 589857, i64 0, i64 2}        ; [ DW_TAG_subrange_type ]
!48 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !49} ; [ DW_TAG_pointer_type ]
!49 = metadata !{i32 589843, metadata !1, metadata !"stat", metadata !10, i32 47, i64 1152, i64 64, i64 0, i32 0, null, metadata !50, i32 0, null} ; [ DW_TAG_structure_type ]
!50 = metadata !{metadata !51, metadata !52, metadata !54, metadata !55, metadata !56, metadata !57, metadata !58, metadata !59, metadata !60, metadata !61, metadata !62, metadata !64, metadata !65, metadata !66, metadata !67}
!51 = metadata !{i32 589837, metadata !49, metadata !"st_dev", metadata !10, i32 48, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ]
!52 = metadata !{i32 589837, metadata !49, metadata !"st_ino", metadata !10, i32 53, i64 64, i64 64, i64 64, i32 0, metadata !53} ; [ DW_TAG_member ]
!53 = metadata !{i32 589846, metadata !12, metadata !"__ino_t", metadata !12, i32 138, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!54 = metadata !{i32 589837, metadata !49, metadata !"st_nlink", metadata !10, i32 61, i64 64, i64 64, i64 128, i32 0, metadata !17} ; [ DW_TAG_member ]
!55 = metadata !{i32 589837, metadata !49, metadata !"st_mode", metadata !10, i32 62, i64 32, i64 32, i64 192, i32 0, metadata !19} ; [ DW_TAG_member ]
!56 = metadata !{i32 589837, metadata !49, metadata !"st_uid", metadata !10, i32 64, i64 32, i64 32, i64 224, i32 0, metadata !22} ; [ DW_TAG_member ]
!57 = metadata !{i32 589837, metadata !49, metadata !"st_gid", metadata !10, i32 65, i64 32, i64 32, i64 256, i32 0, metadata !24} ; [ DW_TAG_member ]
!58 = metadata !{i32 589837, metadata !49, metadata !"__pad0", metadata !10, i32 67, i64 32, i64 32, i64 288, i32 0, metadata !26} ; [ DW_TAG_member ]
!59 = metadata !{i32 589837, metadata !49, metadata !"st_rdev", metadata !10, i32 69, i64 64, i64 64, i64 320, i32 0, metadata !11} ; [ DW_TAG_member ]
!60 = metadata !{i32 589837, metadata !49, metadata !"st_size", metadata !10, i32 74, i64 64, i64 64, i64 384, i32 0, metadata !29} ; [ DW_TAG_member ]
!61 = metadata !{i32 589837, metadata !49, metadata !"st_blksize", metadata !10, i32 78, i64 64, i64 64, i64 448, i32 0, metadata !32} ; [ DW_TAG_member ]
!62 = metadata !{i32 589837, metadata !49, metadata !"st_blocks", metadata !10, i32 80, i64 64, i64 64, i64 512, i32 0, metadata !63} ; [ DW_TAG_member ]
!63 = metadata !{i32 589846, metadata !12, metadata !"__blkcnt_t", metadata !12, i32 170, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!64 = metadata !{i32 589837, metadata !49, metadata !"st_atim", metadata !10, i32 91, i64 128, i64 64, i64 576, i32 0, metadata !36} ; [ DW_TAG_member ]
!65 = metadata !{i32 589837, metadata !49, metadata !"st_mtim", metadata !10, i32 92, i64 128, i64 64, i64 704, i32 0, metadata !36} ; [ DW_TAG_member ]
!66 = metadata !{i32 589837, metadata !49, metadata !"st_ctim", metadata !10, i32 93, i64 128, i64 64, i64 832, i32 0, metadata !36} ; [ DW_TAG_member ]
!67 = metadata !{i32 589837, metadata !49, metadata !"__unused", metadata !10, i32 106, i64 192, i64 64, i64 960, i32 0, metadata !45} ; [ DW_TAG_member ]
!68 = metadata !{i32 589870, i32 0, metadata !1, metadata !"open64", metadata !"open64", metadata !"open64", metadata !1, i32 194, metadata !69, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, ...)* @open64} ; [ DW_TAG_subprogram ]
!69 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !70, i32 0, null} ; [ DW_TAG_subroutine_type ]
!70 = metadata !{metadata !26, metadata !71, metadata !26}
!71 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !72} ; [ DW_TAG_pointer_type ]
!72 = metadata !{i32 589862, metadata !1, metadata !"", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !73} ; [ DW_TAG_const_type ]
!73 = metadata !{i32 589860, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!74 = metadata !{i32 589870, i32 0, metadata !1, metadata !"open", metadata !"open", metadata !"open", metadata !1, i32 65, metadata !69, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, ...)* @open} ; [ DW_TAG_subprogram ]
!75 = metadata !{i32 589870, i32 0, metadata !1, metadata !"getdents", metadata !"getdents", metadata !"getdents", metadata !1, i32 168, metadata !76, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, %struct.dirent*, i64)* @getdents} ; [ DW_TAG_subprogram ]
!76 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !77, i32 0, null} ; [ DW_TAG_subroutine_type ]
!77 = metadata !{metadata !78, metadata !26, metadata !80, metadata !94}
!78 = metadata !{i32 589846, metadata !79, metadata !"ssize_t", metadata !79, i32 116, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!79 = metadata !{i32 589865, metadata !"types.h", metadata !"/usr/include/x86_64-linux-gnu/sys", metadata !2} ; [ DW_TAG_file_type ]
!80 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !81} ; [ DW_TAG_pointer_type ]
!81 = metadata !{i32 589843, metadata !1, metadata !"dirent", metadata !82, i32 24, i64 2240, i64 64, i64 0, i32 0, null, metadata !83, i32 0, null} ; [ DW_TAG_structure_type ]
!82 = metadata !{i32 589865, metadata !"dirent.h", metadata !"/usr/include/x86_64-linux-gnu/bits", metadata !2} ; [ DW_TAG_file_type ]
!83 = metadata !{metadata !84, metadata !85, metadata !86, metadata !88, metadata !90}
!84 = metadata !{i32 589837, metadata !81, metadata !"d_ino", metadata !82, i32 26, i64 64, i64 64, i64 0, i32 0, metadata !53} ; [ DW_TAG_member ]
!85 = metadata !{i32 589837, metadata !81, metadata !"d_off", metadata !82, i32 27, i64 64, i64 64, i64 64, i32 0, metadata !29} ; [ DW_TAG_member ]
!86 = metadata !{i32 589837, metadata !81, metadata !"d_reclen", metadata !82, i32 32, i64 16, i64 16, i64 128, i32 0, metadata !87} ; [ DW_TAG_member ]
!87 = metadata !{i32 589860, metadata !1, metadata !"short unsigned int", metadata !1, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!88 = metadata !{i32 589837, metadata !81, metadata !"d_type", metadata !82, i32 33, i64 8, i64 8, i64 144, i32 0, metadata !89} ; [ DW_TAG_member ]
!89 = metadata !{i32 589860, metadata !1, metadata !"unsigned char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!90 = metadata !{i32 589837, metadata !81, metadata !"d_name", metadata !82, i32 34, i64 2048, i64 8, i64 152, i32 0, metadata !91} ; [ DW_TAG_member ]
!91 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 2048, i64 8, i64 0, i32 0, metadata !73, metadata !92, i32 0, null} ; [ DW_TAG_array_type ]
!92 = metadata !{metadata !93}
!93 = metadata !{i32 589857, i64 0, i64 255}      ; [ DW_TAG_subrange_type ]
!94 = metadata !{i32 589846, metadata !79, metadata !"size_t", metadata !79, i32 151, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!95 = metadata !{i32 589870, i32 0, metadata !1, metadata !"statfs", metadata !"statfs", metadata !"statfs", metadata !1, i32 143, metadata !96, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.statfs*)* @statfs} ; [ DW_TAG_subprogram ]
!96 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !97, i32 0, null} ; [ DW_TAG_subroutine_type ]
!97 = metadata !{metadata !26, metadata !71, metadata !98}
!98 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !99} ; [ DW_TAG_pointer_type ]
!99 = metadata !{i32 589843, metadata !1, metadata !"statfs", metadata !100, i32 26, i64 960, i64 64, i64 0, i32 0, null, metadata !101, i32 0, null} ; [ DW_TAG_structure_type ]
!100 = metadata !{i32 589865, metadata !"statfs.h", metadata !"/usr/include/x86_64-linux-gnu/bits", metadata !2} ; [ DW_TAG_file_type ]
!101 = metadata !{metadata !102, metadata !103, metadata !104, metadata !106, metadata !107, metadata !108, metadata !110, metadata !111, metadata !119, metadata !120, metadata !121, metadata !122}
!102 = metadata !{i32 589837, metadata !99, metadata !"f_type", metadata !100, i32 27, i64 64, i64 64, i64 0, i32 0, metadata !30} ; [ DW_TAG_member ]
!103 = metadata !{i32 589837, metadata !99, metadata !"f_bsize", metadata !100, i32 28, i64 64, i64 64, i64 64, i32 0, metadata !30} ; [ DW_TAG_member ]
!104 = metadata !{i32 589837, metadata !99, metadata !"f_blocks", metadata !100, i32 30, i64 64, i64 64, i64 128, i32 0, metadata !105} ; [ DW_TAG_member ]
!105 = metadata !{i32 589846, metadata !12, metadata !"__fsblkcnt_t", metadata !12, i32 174, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!106 = metadata !{i32 589837, metadata !99, metadata !"f_bfree", metadata !100, i32 31, i64 64, i64 64, i64 192, i32 0, metadata !105} ; [ DW_TAG_member ]
!107 = metadata !{i32 589837, metadata !99, metadata !"f_bavail", metadata !100, i32 32, i64 64, i64 64, i64 256, i32 0, metadata !105} ; [ DW_TAG_member ]
!108 = metadata !{i32 589837, metadata !99, metadata !"f_files", metadata !100, i32 33, i64 64, i64 64, i64 320, i32 0, metadata !109} ; [ DW_TAG_member ]
!109 = metadata !{i32 589846, metadata !12, metadata !"__fsfilcnt_t", metadata !12, i32 178, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!110 = metadata !{i32 589837, metadata !99, metadata !"f_ffree", metadata !100, i32 34, i64 64, i64 64, i64 384, i32 0, metadata !109} ; [ DW_TAG_member ]
!111 = metadata !{i32 589837, metadata !99, metadata !"f_fsid", metadata !100, i32 42, i64 64, i64 32, i64 448, i32 0, metadata !112} ; [ DW_TAG_member ]
!112 = metadata !{i32 589846, metadata !12, metadata !"__fsid_t", metadata !12, i32 145, i64 0, i64 0, i64 0, i32 0, metadata !113} ; [ DW_TAG_typedef ]
!113 = metadata !{i32 589843, metadata !1, metadata !"", metadata !12, i32 144, i64 64, i64 32, i64 0, i32 0, null, metadata !114, i32 0, null} ; [ DW_TAG_structure_type ]
!114 = metadata !{metadata !115}
!115 = metadata !{i32 589837, metadata !113, metadata !"__val", metadata !12, i32 144, i64 64, i64 32, i64 0, i32 0, metadata !116} ; [ DW_TAG_member ]
!116 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !26, metadata !117, i32 0, null} ; [ DW_TAG_array_type ]
!117 = metadata !{metadata !118}
!118 = metadata !{i32 589857, i64 0, i64 1}       ; [ DW_TAG_subrange_type ]
!119 = metadata !{i32 589837, metadata !99, metadata !"f_namelen", metadata !100, i32 43, i64 64, i64 64, i64 512, i32 0, metadata !30} ; [ DW_TAG_member ]
!120 = metadata !{i32 589837, metadata !99, metadata !"f_frsize", metadata !100, i32 44, i64 64, i64 64, i64 576, i32 0, metadata !30} ; [ DW_TAG_member ]
!121 = metadata !{i32 589837, metadata !99, metadata !"f_flags", metadata !100, i32 45, i64 64, i64 64, i64 640, i32 0, metadata !30} ; [ DW_TAG_member ]
!122 = metadata !{i32 589837, metadata !99, metadata !"f_spare", metadata !100, i32 46, i64 256, i64 64, i64 704, i32 0, metadata !123} ; [ DW_TAG_member ]
!123 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 256, i64 64, i64 0, i32 0, metadata !30, metadata !124, i32 0, null} ; [ DW_TAG_array_type ]
!124 = metadata !{metadata !125}
!125 = metadata !{i32 589857, i64 0, i64 3}       ; [ DW_TAG_subrange_type ]
!126 = metadata !{i32 589870, i32 0, metadata !1, metadata !"ftruncate", metadata !"ftruncate", metadata !"ftruncate", metadata !1, i32 139, metadata !127, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @ftruncate} ; [ DW_TAG_subprogram ]
!127 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !128, i32 0, null} ; [ DW_TAG_subroutine_type ]
!128 = metadata !{metadata !26, metadata !26, metadata !129}
!129 = metadata !{i32 589846, metadata !79, metadata !"off_t", metadata !79, i32 94, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!130 = metadata !{i32 589870, i32 0, metadata !1, metadata !"fstat", metadata !"fstat", metadata !"fstat", metadata !1, i32 132, metadata !131, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.stat*)* @fstat} ; [ DW_TAG_subprogram ]
!131 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !132, i32 0, null} ; [ DW_TAG_subroutine_type ]
!132 = metadata !{metadata !26, metadata !26, metadata !48}
!133 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fxstat", metadata !"__fxstat", metadata !"__fxstat", metadata !1, i32 125, metadata !134, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, %struct.stat*)* @__fxstat} ; [ DW_TAG_subprogram ]
!134 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !135, i32 0, null} ; [ DW_TAG_subroutine_type ]
!135 = metadata !{metadata !26, metadata !26, metadata !26, metadata !48}
!136 = metadata !{i32 589870, i32 0, metadata !1, metadata !"lstat", metadata !"lstat", metadata !"lstat", metadata !1, i32 118, metadata !137, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat*)* @lstat} ; [ DW_TAG_subprogram ]
!137 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !138, i32 0, null} ; [ DW_TAG_subroutine_type ]
!138 = metadata !{metadata !26, metadata !71, metadata !48}
!139 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__lxstat", metadata !"__lxstat", metadata !"__lxstat", metadata !1, i32 111, metadata !140, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*)* @__lxstat} ; [ DW_TAG_subprogram ]
!140 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !141, i32 0, null} ; [ DW_TAG_subroutine_type ]
!141 = metadata !{metadata !26, metadata !26, metadata !71, metadata !48}
!142 = metadata !{i32 589870, i32 0, metadata !1, metadata !"stat", metadata !"stat", metadata !"stat", metadata !1, i32 104, metadata !137, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat*)* @stat} ; [ DW_TAG_subprogram ]
!143 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__xstat", metadata !"__xstat", metadata !"__xstat", metadata !1, i32 97, metadata !140, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*)* @__xstat} ; [ DW_TAG_subprogram ]
!144 = metadata !{i32 589870, i32 0, metadata !1, metadata !"lseek", metadata !"lseek", metadata !"lseek", metadata !1, i32 93, metadata !145, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i64, i32)* @lseek} ; [ DW_TAG_subprogram ]
!145 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !146, i32 0, null} ; [ DW_TAG_subroutine_type ]
!146 = metadata !{metadata !129, metadata !26, metadata !129, metadata !26}
!147 = metadata !{i32 589870, i32 0, metadata !1, metadata !"openat", metadata !"openat", metadata !"openat", metadata !1, i32 79, metadata !148, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, i32, ...)* @openat} ; [ DW_TAG_subprogram ]
!148 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !149, i32 0, null} ; [ DW_TAG_subroutine_type ]
!149 = metadata !{metadata !26, metadata !26, metadata !71, metadata !26}
!150 = metadata !{i32 590081, metadata !0, metadata !"a", metadata !1, i32 41, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!151 = metadata !{i32 590081, metadata !0, metadata !"b", metadata !1, i32 41, metadata !48, i32 0} ; [ DW_TAG_arg_variable ]
!152 = metadata !{i32 590081, metadata !68, metadata !"pathname", metadata !1, i32 194, metadata !71, i32 0} ; [ DW_TAG_arg_variable ]
!153 = metadata !{i32 590081, metadata !68, metadata !"flags", metadata !1, i32 194, metadata !26, i32 0} ; [ DW_TAG_arg_variable ]
!154 = metadata !{i32 590080, metadata !155, metadata !"mode", metadata !1, i32 195, metadata !156, i32 0} ; [ DW_TAG_auto_variable ]
!155 = metadata !{i32 589835, metadata !68, i32 194, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!156 = metadata !{i32 589846, metadata !79, metadata !"mode_t", metadata !79, i32 76, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ]
!157 = metadata !{i32 590080, metadata !158, metadata !"ap", metadata !1, i32 199, metadata !159, i32 0} ; [ DW_TAG_auto_variable ]
!158 = metadata !{i32 589835, metadata !155, i32 200, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!159 = metadata !{i32 589846, metadata !160, metadata !"va_list", metadata !160, i32 111, i64 0, i64 0, i64 0, i32 0, metadata !161} ; [ DW_TAG_typedef ]
!160 = metadata !{i32 589865, metadata !"stdio.h", metadata !"/usr/include", metadata !2} ; [ DW_TAG_file_type ]
!161 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 192, i64 64, i64 0, i32 0, metadata !162, metadata !170, i32 0, null} ; [ DW_TAG_array_type ]
!162 = metadata !{i32 589843, metadata !1, metadata !"__va_list_tag", metadata !163, i32 0, i64 192, i64 64, i64 0, i32 0, null, metadata !164, i32 0, null} ; [ DW_TAG_structure_type ]
!163 = metadata !{i32 589865, metadata !"<built-in>", metadata !"/home/qirong/Frog/frog_test/tools/KLEE_SOURCE_2015/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!164 = metadata !{metadata !165, metadata !166, metadata !167, metadata !169}
!165 = metadata !{i32 589837, metadata !162, metadata !"gp_offset", metadata !163, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_member ]
!166 = metadata !{i32 589837, metadata !162, metadata !"fp_offset", metadata !163, i32 0, i64 32, i64 32, i64 32, i32 0, metadata !20} ; [ DW_TAG_member ]
!167 = metadata !{i32 589837, metadata !162, metadata !"overflow_arg_area", metadata !163, i32 0, i64 64, i64 64, i64 64, i32 0, metadata !168} ; [ DW_TAG_member ]
!168 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!169 = metadata !{i32 589837, metadata !162, metadata !"reg_save_area", metadata !163, i32 0, i64 64, i64 64, i64 128, i32 0, metadata !168} ; [ DW_TAG_member ]
!170 = metadata !{metadata !171}
!171 = metadata !{i32 589857, i64 0, i64 0}       ; [ DW_TAG_subrange_type ]
!172 = metadata !{i32 590081, metadata !74, metadata !"pathname", metadata !1, i32 65, metadata !71, i32 0} ; [ DW_TAG_arg_variable ]
!173 = metadata !{i32 590081, metadata !74, metadata !"flags", metadata !1, i32 65, metadata !26, i32 0} ; [ DW_TAG_arg_variable ]
!174 = metadata !{i32 590080, metadata !175, metadata !"mode", metadata !1, i32 66, metadata !156, i32 0} ; [ DW_TAG_auto_variable ]
!175 = metadata !{i32 589835, metadata !74, i32 65, i32 0, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!176 = metadata !{i32 590080, metadata !177, metadata !"ap", metadata !1, i32 70, metadata !159, i32 0} ; [ DW_TAG_auto_variable ]
!177 = metadata !{i32 589835, metadata !175, i32 71, i32 0, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!178 = metadata !{i32 590081, metadata !75, metadata !"fd", metadata !1, i32 168, metadata !26, i32 0} ; [ DW_TAG_arg_variable ]
!179 = metadata !{i32 590081, metadata !75, metadata !"dirp", metadata !1, i32 168, metadata !80, i32 0} ; [ DW_TAG_arg_variable ]
!180 = metadata !{i32 590081, metadata !75, metadata !"nbytes", metadata !1, i32 168, metadata !94, i32 0} ; [ DW_TAG_arg_variable ]
!181 = metadata !{i32 590080, metadata !182, metadata !"dp64", metadata !1, i32 169, metadata !183, i32 0} ; [ DW_TAG_auto_variable ]
!182 = metadata !{i32 589835, metadata !75, i32 168, i32 0, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
!183 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !184} ; [ DW_TAG_pointer_type ]
!184 = metadata !{i32 589843, metadata !1, metadata !"dirent64", metadata !82, i32 39, i64 2240, i64 64, i64 0, i32 0, null, metadata !185, i32 0, null} ; [ DW_TAG_structure_type ]
!185 = metadata !{metadata !186, metadata !187, metadata !189, metadata !190, metadata !191}
!186 = metadata !{i32 589837, metadata !184, metadata !"d_ino", metadata !82, i32 40, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ]
!187 = metadata !{i32 589837, metadata !184, metadata !"d_off", metadata !82, i32 41, i64 64, i64 64, i64 64, i32 0, metadata !188} ; [ DW_TAG_member ]
!188 = metadata !{i32 589846, metadata !12, metadata !"__off64_t", metadata !12, i32 143, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!189 = metadata !{i32 589837, metadata !184, metadata !"d_reclen", metadata !82, i32 42, i64 16, i64 16, i64 128, i32 0, metadata !87} ; [ DW_TAG_member ]
!190 = metadata !{i32 589837, metadata !184, metadata !"d_type", metadata !82, i32 43, i64 8, i64 8, i64 144, i32 0, metadata !89} ; [ DW_TAG_member ]
!191 = metadata !{i32 589837, metadata !184, metadata !"d_name", metadata !82, i32 44, i64 2048, i64 8, i64 152, i32 0, metadata !91} ; [ DW_TAG_member ]
!192 = metadata !{i32 590080, metadata !182, metadata !"res", metadata !1, i32 170, metadata !78, i32 0} ; [ DW_TAG_auto_variable ]
!193 = metadata !{i32 590080, metadata !194, metadata !"end", metadata !1, i32 173, metadata !183, i32 0} ; [ DW_TAG_auto_variable ]
!194 = metadata !{i32 589835, metadata !182, i32 173, i32 0, metadata !1, i32 6} ; [ DW_TAG_lexical_block ]
!195 = metadata !{i32 590080, metadata !196, metadata !"dp", metadata !1, i32 175, metadata !80, i32 0} ; [ DW_TAG_auto_variable ]
!196 = metadata !{i32 589835, metadata !194, i32 175, i32 0, metadata !1, i32 7} ; [ DW_TAG_lexical_block ]
!197 = metadata !{i32 590080, metadata !196, metadata !"name_len", metadata !1, i32 176, metadata !94, i32 0} ; [ DW_TAG_auto_variable ]
!198 = metadata !{i32 590081, metadata !95, metadata !"path", metadata !1, i32 143, metadata !71, i32 0} ; [ DW_TAG_arg_variable ]
!199 = metadata !{i32 590081, metadata !95, metadata !"buf32", metadata !1, i32 143, metadata !98, i32 0} ; [ DW_TAG_arg_variable ]
!200 = metadata !{i32 590081, metadata !126, metadata !"fd", metadata !1, i32 139, metadata !26, i32 0} ; [ DW_TAG_arg_variable ]
!201 = metadata !{i32 590081, metadata !126, metadata !"length", metadata !1, i32 139, metadata !129, i32 0} ; [ DW_TAG_arg_variable ]
!202 = metadata !{i32 590081, metadata !130, metadata !"fd", metadata !1, i32 132, metadata !26, i32 0} ; [ DW_TAG_arg_variable ]
!203 = metadata !{i32 590081, metadata !130, metadata !"buf", metadata !1, i32 132, metadata !48, i32 0} ; [ DW_TAG_arg_variable ]
!204 = metadata !{i32 590080, metadata !205, metadata !"tmp", metadata !1, i32 133, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!205 = metadata !{i32 589835, metadata !130, i32 132, i32 0, metadata !1, i32 10} ; [ DW_TAG_lexical_block ]
!206 = metadata !{i32 590080, metadata !205, metadata !"res", metadata !1, i32 134, metadata !26, i32 0} ; [ DW_TAG_auto_variable ]
!207 = metadata !{i32 590081, metadata !133, metadata !"vers", metadata !1, i32 125, metadata !26, i32 0} ; [ DW_TAG_arg_variable ]
!208 = metadata !{i32 590081, metadata !133, metadata !"fd", metadata !1, i32 125, metadata !26, i32 0} ; [ DW_TAG_arg_variable ]
!209 = metadata !{i32 590081, metadata !133, metadata !"buf", metadata !1, i32 125, metadata !48, i32 0} ; [ DW_TAG_arg_variable ]
!210 = metadata !{i32 590080, metadata !211, metadata !"tmp", metadata !1, i32 126, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!211 = metadata !{i32 589835, metadata !133, i32 125, i32 0, metadata !1, i32 11} ; [ DW_TAG_lexical_block ]
!212 = metadata !{i32 590080, metadata !211, metadata !"res", metadata !1, i32 127, metadata !26, i32 0} ; [ DW_TAG_auto_variable ]
!213 = metadata !{i32 590081, metadata !136, metadata !"path", metadata !1, i32 118, metadata !71, i32 0} ; [ DW_TAG_arg_variable ]
!214 = metadata !{i32 590081, metadata !136, metadata !"buf", metadata !1, i32 118, metadata !48, i32 0} ; [ DW_TAG_arg_variable ]
!215 = metadata !{i32 590080, metadata !216, metadata !"tmp", metadata !1, i32 119, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!216 = metadata !{i32 589835, metadata !136, i32 118, i32 0, metadata !1, i32 12} ; [ DW_TAG_lexical_block ]
!217 = metadata !{i32 590080, metadata !216, metadata !"res", metadata !1, i32 120, metadata !26, i32 0} ; [ DW_TAG_auto_variable ]
!218 = metadata !{i32 590081, metadata !139, metadata !"vers", metadata !1, i32 111, metadata !26, i32 0} ; [ DW_TAG_arg_variable ]
!219 = metadata !{i32 590081, metadata !139, metadata !"path", metadata !1, i32 111, metadata !71, i32 0} ; [ DW_TAG_arg_variable ]
!220 = metadata !{i32 590081, metadata !139, metadata !"buf", metadata !1, i32 111, metadata !48, i32 0} ; [ DW_TAG_arg_variable ]
!221 = metadata !{i32 590080, metadata !222, metadata !"tmp", metadata !1, i32 112, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!222 = metadata !{i32 589835, metadata !139, i32 111, i32 0, metadata !1, i32 13} ; [ DW_TAG_lexical_block ]
!223 = metadata !{i32 590080, metadata !222, metadata !"res", metadata !1, i32 113, metadata !26, i32 0} ; [ DW_TAG_auto_variable ]
!224 = metadata !{i32 590081, metadata !142, metadata !"path", metadata !1, i32 104, metadata !71, i32 0} ; [ DW_TAG_arg_variable ]
!225 = metadata !{i32 590081, metadata !142, metadata !"buf", metadata !1, i32 104, metadata !48, i32 0} ; [ DW_TAG_arg_variable ]
!226 = metadata !{i32 590080, metadata !227, metadata !"tmp", metadata !1, i32 105, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!227 = metadata !{i32 589835, metadata !142, i32 104, i32 0, metadata !1, i32 14} ; [ DW_TAG_lexical_block ]
!228 = metadata !{i32 590080, metadata !227, metadata !"res", metadata !1, i32 106, metadata !26, i32 0} ; [ DW_TAG_auto_variable ]
!229 = metadata !{i32 590081, metadata !143, metadata !"vers", metadata !1, i32 97, metadata !26, i32 0} ; [ DW_TAG_arg_variable ]
!230 = metadata !{i32 590081, metadata !143, metadata !"path", metadata !1, i32 97, metadata !71, i32 0} ; [ DW_TAG_arg_variable ]
!231 = metadata !{i32 590081, metadata !143, metadata !"buf", metadata !1, i32 97, metadata !48, i32 0} ; [ DW_TAG_arg_variable ]
!232 = metadata !{i32 590080, metadata !233, metadata !"tmp", metadata !1, i32 98, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!233 = metadata !{i32 589835, metadata !143, i32 97, i32 0, metadata !1, i32 15} ; [ DW_TAG_lexical_block ]
!234 = metadata !{i32 590080, metadata !233, metadata !"res", metadata !1, i32 99, metadata !26, i32 0} ; [ DW_TAG_auto_variable ]
!235 = metadata !{i32 590081, metadata !144, metadata !"fd", metadata !1, i32 93, metadata !26, i32 0} ; [ DW_TAG_arg_variable ]
!236 = metadata !{i32 590081, metadata !144, metadata !"off", metadata !1, i32 93, metadata !129, i32 0} ; [ DW_TAG_arg_variable ]
!237 = metadata !{i32 590081, metadata !144, metadata !"whence", metadata !1, i32 93, metadata !26, i32 0} ; [ DW_TAG_arg_variable ]
!238 = metadata !{i32 590081, metadata !147, metadata !"fd", metadata !1, i32 79, metadata !26, i32 0} ; [ DW_TAG_arg_variable ]
!239 = metadata !{i32 590081, metadata !147, metadata !"pathname", metadata !1, i32 79, metadata !71, i32 0} ; [ DW_TAG_arg_variable ]
!240 = metadata !{i32 590081, metadata !147, metadata !"flags", metadata !1, i32 79, metadata !26, i32 0} ; [ DW_TAG_arg_variable ]
!241 = metadata !{i32 590080, metadata !242, metadata !"mode", metadata !1, i32 80, metadata !156, i32 0} ; [ DW_TAG_auto_variable ]
!242 = metadata !{i32 589835, metadata !147, i32 79, i32 0, metadata !1, i32 17} ; [ DW_TAG_lexical_block ]
!243 = metadata !{i32 590080, metadata !244, metadata !"ap", metadata !1, i32 84, metadata !159, i32 0} ; [ DW_TAG_auto_variable ]
!244 = metadata !{i32 589835, metadata !242, i32 85, i32 0, metadata !1, i32 18} ; [ DW_TAG_lexical_block ]
!245 = metadata !{i32 65, i32 0, metadata !74, null}
!246 = metadata !{i32 0}
!247 = metadata !{i32 66, i32 0, metadata !175, null}
!248 = metadata !{i32 68, i32 0, metadata !175, null}
!249 = metadata !{i32 70, i32 0, metadata !177, null}
!250 = metadata !{i32 71, i32 0, metadata !177, null}
!251 = metadata !{i32 72, i32 0, metadata !177, null}
!252 = metadata !{i32 73, i32 0, metadata !177, null}
!253 = metadata !{i32 76, i32 0, metadata !175, null}
!254 = metadata !{i32 194, i32 0, metadata !68, null}
!255 = metadata !{i32 195, i32 0, metadata !155, null}
!256 = metadata !{i32 197, i32 0, metadata !155, null}
!257 = metadata !{i32 199, i32 0, metadata !158, null}
!258 = metadata !{i32 200, i32 0, metadata !158, null}
!259 = metadata !{i32 201, i32 0, metadata !158, null}
!260 = metadata !{i32 202, i32 0, metadata !158, null}
!261 = metadata !{i32 205, i32 0, metadata !155, null}
!262 = metadata !{i32 168, i32 0, metadata !75, null}
!263 = metadata !{i32 169, i32 0, metadata !182, null}
!264 = metadata !{i32 170, i32 0, metadata !182, null}
!265 = metadata !{i32 172, i32 0, metadata !182, null}
!266 = metadata !{i32 173, i32 0, metadata !194, null}
!267 = metadata !{i32 174, i32 0, metadata !194, null}
!268 = metadata !{i32 177, i32 0, metadata !196, null}
!269 = metadata !{i32 183, i32 0, metadata !196, null}
!270 = metadata !{i32 187, i32 0, metadata !182, null}
!271 = metadata !{i32 143, i32 0, metadata !95, null}
!272 = metadata !{i32 162, i32 0, metadata !273, null}
!273 = metadata !{i32 589835, metadata !95, i32 143, i32 0, metadata !1, i32 8} ; [ DW_TAG_lexical_block ]
!274 = metadata !{i32 139, i32 0, metadata !126, null}
!275 = metadata !{i32 140, i32 0, metadata !276, null}
!276 = metadata !{i32 589835, metadata !126, i32 139, i32 0, metadata !1, i32 9} ; [ DW_TAG_lexical_block ]
!277 = metadata !{i32 132, i32 0, metadata !130, null}
!278 = metadata !{i32 133, i32 0, metadata !205, null}
!279 = metadata !{i32 134, i32 0, metadata !205, null}
!280 = metadata !{i32 41, i32 0, metadata !0, metadata !281}
!281 = metadata !{i32 135, i32 0, metadata !205, null}
!282 = metadata !{i32 42, i32 0, metadata !283, metadata !281}
!283 = metadata !{i32 589835, metadata !0, i32 41, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!284 = metadata !{i32 43, i32 0, metadata !283, metadata !281}
!285 = metadata !{i32 44, i32 0, metadata !283, metadata !281}
!286 = metadata !{i32 45, i32 0, metadata !283, metadata !281}
!287 = metadata !{i32 46, i32 0, metadata !283, metadata !281}
!288 = metadata !{i32 47, i32 0, metadata !283, metadata !281}
!289 = metadata !{i32 48, i32 0, metadata !283, metadata !281}
!290 = metadata !{i32 49, i32 0, metadata !283, metadata !281}
!291 = metadata !{i32 50, i32 0, metadata !283, metadata !281}
!292 = metadata !{i32 51, i32 0, metadata !283, metadata !281}
!293 = metadata !{i32 52, i32 0, metadata !283, metadata !281}
!294 = metadata !{i32 53, i32 0, metadata !283, metadata !281}
!295 = metadata !{i32 54, i32 0, metadata !283, metadata !281}
!296 = metadata !{i32 56, i32 0, metadata !283, metadata !281}
!297 = metadata !{i32 57, i32 0, metadata !283, metadata !281}
!298 = metadata !{i32 58, i32 0, metadata !283, metadata !281}
!299 = metadata !{i32 136, i32 0, metadata !205, null}
!300 = metadata !{i32 125, i32 0, metadata !133, null}
!301 = metadata !{i32 126, i32 0, metadata !211, null}
!302 = metadata !{i32 127, i32 0, metadata !211, null}
!303 = metadata !{i32 41, i32 0, metadata !0, metadata !304}
!304 = metadata !{i32 128, i32 0, metadata !211, null}
!305 = metadata !{i32 42, i32 0, metadata !283, metadata !304}
!306 = metadata !{i32 43, i32 0, metadata !283, metadata !304}
!307 = metadata !{i32 44, i32 0, metadata !283, metadata !304}
!308 = metadata !{i32 45, i32 0, metadata !283, metadata !304}
!309 = metadata !{i32 46, i32 0, metadata !283, metadata !304}
!310 = metadata !{i32 47, i32 0, metadata !283, metadata !304}
!311 = metadata !{i32 48, i32 0, metadata !283, metadata !304}
!312 = metadata !{i32 49, i32 0, metadata !283, metadata !304}
!313 = metadata !{i32 50, i32 0, metadata !283, metadata !304}
!314 = metadata !{i32 51, i32 0, metadata !283, metadata !304}
!315 = metadata !{i32 52, i32 0, metadata !283, metadata !304}
!316 = metadata !{i32 53, i32 0, metadata !283, metadata !304}
!317 = metadata !{i32 54, i32 0, metadata !283, metadata !304}
!318 = metadata !{i32 56, i32 0, metadata !283, metadata !304}
!319 = metadata !{i32 57, i32 0, metadata !283, metadata !304}
!320 = metadata !{i32 58, i32 0, metadata !283, metadata !304}
!321 = metadata !{i32 129, i32 0, metadata !211, null}
!322 = metadata !{i32 118, i32 0, metadata !136, null}
!323 = metadata !{i32 119, i32 0, metadata !216, null}
!324 = metadata !{i32 120, i32 0, metadata !216, null}
!325 = metadata !{i32 41, i32 0, metadata !0, metadata !326}
!326 = metadata !{i32 121, i32 0, metadata !216, null}
!327 = metadata !{i32 42, i32 0, metadata !283, metadata !326}
!328 = metadata !{i32 43, i32 0, metadata !283, metadata !326}
!329 = metadata !{i32 44, i32 0, metadata !283, metadata !326}
!330 = metadata !{i32 45, i32 0, metadata !283, metadata !326}
!331 = metadata !{i32 46, i32 0, metadata !283, metadata !326}
!332 = metadata !{i32 47, i32 0, metadata !283, metadata !326}
!333 = metadata !{i32 48, i32 0, metadata !283, metadata !326}
!334 = metadata !{i32 49, i32 0, metadata !283, metadata !326}
!335 = metadata !{i32 50, i32 0, metadata !283, metadata !326}
!336 = metadata !{i32 51, i32 0, metadata !283, metadata !326}
!337 = metadata !{i32 52, i32 0, metadata !283, metadata !326}
!338 = metadata !{i32 53, i32 0, metadata !283, metadata !326}
!339 = metadata !{i32 54, i32 0, metadata !283, metadata !326}
!340 = metadata !{i32 56, i32 0, metadata !283, metadata !326}
!341 = metadata !{i32 57, i32 0, metadata !283, metadata !326}
!342 = metadata !{i32 58, i32 0, metadata !283, metadata !326}
!343 = metadata !{i32 122, i32 0, metadata !216, null}
!344 = metadata !{i32 111, i32 0, metadata !139, null}
!345 = metadata !{i32 112, i32 0, metadata !222, null}
!346 = metadata !{i32 113, i32 0, metadata !222, null}
!347 = metadata !{i32 41, i32 0, metadata !0, metadata !348}
!348 = metadata !{i32 114, i32 0, metadata !222, null}
!349 = metadata !{i32 42, i32 0, metadata !283, metadata !348}
!350 = metadata !{i32 43, i32 0, metadata !283, metadata !348}
!351 = metadata !{i32 44, i32 0, metadata !283, metadata !348}
!352 = metadata !{i32 45, i32 0, metadata !283, metadata !348}
!353 = metadata !{i32 46, i32 0, metadata !283, metadata !348}
!354 = metadata !{i32 47, i32 0, metadata !283, metadata !348}
!355 = metadata !{i32 48, i32 0, metadata !283, metadata !348}
!356 = metadata !{i32 49, i32 0, metadata !283, metadata !348}
!357 = metadata !{i32 50, i32 0, metadata !283, metadata !348}
!358 = metadata !{i32 51, i32 0, metadata !283, metadata !348}
!359 = metadata !{i32 52, i32 0, metadata !283, metadata !348}
!360 = metadata !{i32 53, i32 0, metadata !283, metadata !348}
!361 = metadata !{i32 54, i32 0, metadata !283, metadata !348}
!362 = metadata !{i32 56, i32 0, metadata !283, metadata !348}
!363 = metadata !{i32 57, i32 0, metadata !283, metadata !348}
!364 = metadata !{i32 58, i32 0, metadata !283, metadata !348}
!365 = metadata !{i32 115, i32 0, metadata !222, null}
!366 = metadata !{i32 104, i32 0, metadata !142, null}
!367 = metadata !{i32 105, i32 0, metadata !227, null}
!368 = metadata !{i32 106, i32 0, metadata !227, null}
!369 = metadata !{i32 41, i32 0, metadata !0, metadata !370}
!370 = metadata !{i32 107, i32 0, metadata !227, null}
!371 = metadata !{i32 42, i32 0, metadata !283, metadata !370}
!372 = metadata !{i32 43, i32 0, metadata !283, metadata !370}
!373 = metadata !{i32 44, i32 0, metadata !283, metadata !370}
!374 = metadata !{i32 45, i32 0, metadata !283, metadata !370}
!375 = metadata !{i32 46, i32 0, metadata !283, metadata !370}
!376 = metadata !{i32 47, i32 0, metadata !283, metadata !370}
!377 = metadata !{i32 48, i32 0, metadata !283, metadata !370}
!378 = metadata !{i32 49, i32 0, metadata !283, metadata !370}
!379 = metadata !{i32 50, i32 0, metadata !283, metadata !370}
!380 = metadata !{i32 51, i32 0, metadata !283, metadata !370}
!381 = metadata !{i32 52, i32 0, metadata !283, metadata !370}
!382 = metadata !{i32 53, i32 0, metadata !283, metadata !370}
!383 = metadata !{i32 54, i32 0, metadata !283, metadata !370}
!384 = metadata !{i32 56, i32 0, metadata !283, metadata !370}
!385 = metadata !{i32 57, i32 0, metadata !283, metadata !370}
!386 = metadata !{i32 58, i32 0, metadata !283, metadata !370}
!387 = metadata !{i32 108, i32 0, metadata !227, null}
!388 = metadata !{i32 97, i32 0, metadata !143, null}
!389 = metadata !{i32 98, i32 0, metadata !233, null}
!390 = metadata !{i32 99, i32 0, metadata !233, null}
!391 = metadata !{i32 41, i32 0, metadata !0, metadata !392}
!392 = metadata !{i32 100, i32 0, metadata !233, null}
!393 = metadata !{i32 42, i32 0, metadata !283, metadata !392}
!394 = metadata !{i32 43, i32 0, metadata !283, metadata !392}
!395 = metadata !{i32 44, i32 0, metadata !283, metadata !392}
!396 = metadata !{i32 45, i32 0, metadata !283, metadata !392}
!397 = metadata !{i32 46, i32 0, metadata !283, metadata !392}
!398 = metadata !{i32 47, i32 0, metadata !283, metadata !392}
!399 = metadata !{i32 48, i32 0, metadata !283, metadata !392}
!400 = metadata !{i32 49, i32 0, metadata !283, metadata !392}
!401 = metadata !{i32 50, i32 0, metadata !283, metadata !392}
!402 = metadata !{i32 51, i32 0, metadata !283, metadata !392}
!403 = metadata !{i32 52, i32 0, metadata !283, metadata !392}
!404 = metadata !{i32 53, i32 0, metadata !283, metadata !392}
!405 = metadata !{i32 54, i32 0, metadata !283, metadata !392}
!406 = metadata !{i32 56, i32 0, metadata !283, metadata !392}
!407 = metadata !{i32 57, i32 0, metadata !283, metadata !392}
!408 = metadata !{i32 58, i32 0, metadata !283, metadata !392}
!409 = metadata !{i32 101, i32 0, metadata !233, null}
!410 = metadata !{i32 93, i32 0, metadata !144, null}
!411 = metadata !{i32 94, i32 0, metadata !412, null}
!412 = metadata !{i32 589835, metadata !144, i32 93, i32 0, metadata !1, i32 16} ; [ DW_TAG_lexical_block ]
!413 = metadata !{i32 79, i32 0, metadata !147, null}
!414 = metadata !{i32 80, i32 0, metadata !242, null}
!415 = metadata !{i32 82, i32 0, metadata !242, null}
!416 = metadata !{i32 84, i32 0, metadata !244, null}
!417 = metadata !{i32 85, i32 0, metadata !244, null}
!418 = metadata !{i32 86, i32 0, metadata !244, null}
!419 = metadata !{i32 87, i32 0, metadata !244, null}
!420 = metadata !{i32 90, i32 0, metadata !242, null}
