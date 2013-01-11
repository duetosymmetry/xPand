(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



SetDirectory["~/CMB"];


Block[{Print},
<<xPand/xPand.m;
]
$DefInfoQ=False;
SetOptions[AutomaticRules,Verbose->False];


(*DefConstantSymbol[d];*)
DefManifold[M,4(*d*),{\[Alpha],\[Beta],\[Gamma],\[Mu],\[Nu],\[Lambda],\[Sigma]}];
DefMetric[-1,g[-\[Alpha],-\[Beta]],CD,{";","\!\(\*OverscriptBox[\(\[Del]\), \(_\)]\)"},PrintAs->"\!\(\*OverscriptBox[\(g\), \(_\)]\)"];
BackgroundSlicing[hM,n,g,cdM,{"|","\!\(\*OverscriptBox[\(D\), \(_\)]\)"},Minkowski];
BackgroundSlicing[h,n,g,cd,{"|","\!\(\*OverscriptBox[\(D\), \(_\)]\)"},FLFlat];
BackgroundSlicing[h2,n2,g,cd2,{"|","\!\(\*OverscriptBox[\(D\), \(_\)]\)"},FLCurved];
BackgroundSlicing[h3,n3,g,cd3,{"|","\!\(\*OverscriptBox[\(D\), \(_\)]\)"},BianchiI];
BackgroundSlicing[h4,n4,g,cd4,{"|","\!\(\*OverscriptBox[\(D\), \(_\)]\)"},BianchiB];


DefMetricFields[g,dg,hM]
DefMatterFields[uf, duf,hM]

DefMetricFields[g,dg,h]
DefMatterFields[uf, duf,h]

DefMetricFields[g,dg,h2]
DefMatterFields[uf, duf,h2]
DefMetricFields[g,dg,h3]
DefMatterFields[uf, duf,h3]

DefMetricFields[g,dg,h4]
DefMatterFields[uf, duf,h4]


MyxPandBenchMark[expr_,h_,order_,gauge_]:=ToxPand[expr,dg,uf,duf,h, gauge, order]


$DebugInfoQ=False;
ordermax=4


TimingsxPert=Table[{i,First@AbsoluteTiming[ExpandPerturbation@Perturbed[Conformal[g,gah42][RicciScalarCD[]],i]//ContractMetric//ToCanonical]},{i,1,ordermax}]


TimingsMinkowski=Table[{i,First@AbsoluteTiming[MyxPandBenchMark[RicciScalarCD[],hM,i,NewtonGauge]]},{i,1,ordermax}]
TimingsMinkowskiAny=Table[{i,First@AbsoluteTiming[MyxPandBenchMark[RicciScalarCD[],hM,i,AnyGauge]]},{i,1,ordermax}]


TimingsFLFlat=Table[{i,First@AbsoluteTiming[MyxPandBenchMark[RicciScalarCD[],h,i,NewtonGauge]]},{i,1,ordermax}]
TimingsFLFlatAny=Table[{i,First@AbsoluteTiming[MyxPandBenchMark[RicciScalarCD[],h,i,AnyGauge]]},{i,1,ordermax}]


TimingsFLCurved=Table[{i,First@AbsoluteTiming[MyxPandBenchMark[RicciScalarCD[],h2,i,NewtonGauge]]},{i,1,ordermax}]
TimingsFLCurvedAny=Table[{i,First@AbsoluteTiming[MyxPandBenchMark[RicciScalarCD[],h2,i,AnyGauge]]},{i,1,ordermax}]


TimingsBianchiI=Table[{i,First@AbsoluteTiming[MyxPandBenchMark[RicciScalarCD[],h3,i,NewtonGauge]]},{i,1,ordermax}]
TimingsBianchiIAny=Table[{i,First@AbsoluteTiming[MyxPandBenchMark[RicciScalarCD[],h3,i,AnyGauge]]},{i,1,ordermax}]


TimingsBianchiB=Table[{i,First@AbsoluteTiming[MyxPandBenchMark[RicciScalarCD[],h4,i,NewtonGauge]]},{i,1,ordermax-1}]
TimingsBianchiBAny=Table[{i,First@AbsoluteTiming[MyxPandBenchMark[RicciScalarCD[],h4,i,AnyGauge]]},{i,1,ordermax-1}]


FirstTime=True


NameFileNewt=StringJoin["SaveTimingsNewtonGauge",ToString[ordermax],".dat"];
If[FirstTime,
Put[{TimingsxPert,TimingsMinkowski,TimingsFLFlat,TimingsFLCurved,TimingsBianchiI,TimingsBianchiB},NameFileNewt];,{TimingsxPert,TimingsMinkowski,TimingsFLFlat,TimingsFLCurved,TimingsBianchiI,TimingsBianchiB}=Get[NameFileNewt]]


NameFileAny=StringJoin["SaveTimingsAnyGauge",ToString[ordermax],".dat"];
If[FirstTime,
Put[{TimingsxPert,TimingsMinkowskiAny,TimingsFLFlatAny,TimingsFLCurvedAny,TimingsBianchiIAny,TimingsBianchiBAny},NameFileAny];,{TimingsxPert,TimingsMinkowskiAny,TimingsFLFlatAny,TimingsFLCurvedAny,TimingsBianchiIAny,TimingsBianchiBAny}=Get[NameFileAny]]



