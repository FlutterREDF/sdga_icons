import 'package:sdga_icons/sdga_icons.dart';

/// This routine exists to FORCE TREE SHAKING of the icon fonts that may not be referenced
/// at all within the application.  This is required because the this package
/// have 7 font varieties and it is very likely only one will be used.
/// Tree shaking DOES NOT OCCUR for fonts that are never referenced, so having this
/// method FORCES a reference to the fonts - and invokes tree shaking for
/// each of the three fonts.
/// (Tree shaking occurs when a *const* declaration to an IconData() class occurs.)
///
/// NOTE: VERY IMPORTANT - the `@pargma('vm:entry-point')` annotation is REQUIRED
/// and it is being used to force the dart compilation process to believe that this
/// method is required and that it CAN NOT tree-shake this method when it never
/// finds a call to it in the dart source code.
@pragma('vm:entry-point')
void forceSDGAIconsCompileTimeTreeShaking() {
  // these variables must be declared as var to trigger tree shaking, when declared as const
  // then the tree shaking is not triggered.

  // ignore: unused_local_variable
  var forceBulkTreeShake = SDGAIconsBulk.bounceLeft;
  // ignore: unused_local_variable
  var forceDuotoneTreeShake = SDGAIconsDuotone.alertCircle;
  // ignore: unused_local_variable
  var forceSharpSolidTreeShake = SDGAIconsSharpSolid.arrowRight01;
  // ignore: unused_local_variable
  var forceSharpStrokeTreeShake = SDGAIconsSharpStroke.minusSign;
  // ignore: unused_local_variable
  var forceSolidTreeShake = SDGAIconsSolid.record;
  // ignore: unused_local_variable
  var forceStrokeTreeShake = SDGAIconsStroke.record;
  // ignore: unused_local_variable
  var forceTwotoneTreeShake = SDGAIconsTwotone.alertCircle;
}
