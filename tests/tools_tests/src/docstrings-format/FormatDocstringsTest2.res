/**
Testing JSX and more complex formatting scenarios.

```rescript
let component=()=>{
<div className="container">
<h1>{"Title"->React.string}</h1>
<button onClick={_=>Console.log("clicked")}>{"Click me"->React.string}</button>
</div>
}
```

Testing pattern matching and switch expressions:

```rescript
let handleResult=(result:result<string,string>)=>{
switch result {
| Ok(value)=>Console.log(`Success: ${value}`)
| Error(error)=>Console.error(`Error: ${error}`)
}
}
```
*/
let testJsx = () => "jsx test"

/**
Testing function composition and piping.

```rescript
let processData=(data:array<int>)=>{
data
->Array.filter(x=>x>0)->Array.map(x=>x*2)->Array.reduce(0,(acc,x)=>acc+x)
}

let asyncExample=async()=>{
let data=await fetchData()
let processed=await processData(data)
Console.log(processed)
}
```
*/
let testPipes = () => "pipes test"

/**
Testing resi code blocks.

```resi
type x=int
let x:int => 
    string
module M:{let ff: string => int
}

```
 */
let testResi = () => true
