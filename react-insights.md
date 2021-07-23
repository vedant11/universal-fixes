- React setState method is asynchronous. This means that rather than immediately mutating this.state, setState() creates a pending state transition. If you access this.state after calling this method, it would potentially return the existing value. To prevent this, use the callback function of setState to run code after the call is completed.

- The useEffect hook is built in a way that if we return a function within the method, this function will execute when the component gets disassociated. This is very useful because we can use it to remove unnecessary behavior or prevent memory leaking issues.

- export default React.memo(UserDetails); // for memoization
