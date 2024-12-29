This repository demonstrates a common yet subtle bug in Objective-C related to Key-Value Observing (KVO). The bug occurs when an observer is not removed before the observed object deallocates. This leads to a crash.  The solution involves ensuring that observers are always removed using `removeObserver:` before the observed object's lifetime ends. The example showcases the problematic code and a corrected version.