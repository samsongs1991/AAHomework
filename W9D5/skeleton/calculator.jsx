import React from "react";

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    // your code here
    this.state = {
        "num1": "", 
        "num2": "",
        "result": 0
    }
  }


  // your code here

  render() {
    return (
      <div>
          <h1>Calculator is working</h1>
      </div>
    );
  }
}

export default Calculator;