import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue : Float = 300;
  currentValue := 300;
  Debug.print(debug_show(currentValue));
  
  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show(startTime));
  //let id : Nat = 4464;

  public func topUp(amount: Float) : async () {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };
   public func withdraw(amount: Float) {
      let tempvalue: Float = currentValue - amount;
      if (amount <= currentValue) {
      currentValue -= amount;
       Debug.print(debug_show(currentValue));
      } else {
          Debug.print("amount too large, not enough balance");
        }
 };

 public query func checkBalance(): async Float{
    return currentValue;
 };

public func compound(){
  let currentTime = Time.now();
  let timeElapsedNS = currentTime - startTime;
  let timeElapsedS = timeElapsedNS/1000000000;
  currentValue := currentValue *(1.01 ** Float.fromInt(timeElapsedS));
  startTime := currentTime;
};

};

 