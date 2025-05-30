module Cite = {
  @react.component
  let make = (~author: option<string>, ~children) => {
    // For semantics, check out
    // https://css-tricks.com/quoting-in-html-quotations-citations-and-blockquotes/
    <div>
      foo
    </div>
  }
}

<A
  value=""
  // Comment
/>

<A /* comment */ />

<A>
  // Comment
</A>

<A
// comment1
// comment 2
/>

<A
// comment1
value=""
// comment2
>
  <B /* comment3 */ />
</A>

<A
  value=""
  /* comment */
>
  <B/>
</A>

<A
// comment
>
  <B />
</A>

<A
/* comment */
>
  <B />
</A>

<A /* comment */>
  <B />
</A>

<div>
  // Must not jump inside braces
  {React.string("Hello, World!")}
</div>

<div>
  // Must not jump inside braces
  {// But this one is inside
    React.string("Hello, World!")}
</div>

<div>
  // Outside comment
  {// But this one is inside
    let x = 1
    let y = 2
  }
</div>

let x = <>
  // before a
  {a} // after a
  // before b
  {b} // after b
</>
