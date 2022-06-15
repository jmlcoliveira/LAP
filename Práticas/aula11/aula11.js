class Succ {
    constructor(a0){
        this.a0 = a0;
        this.current = a0;
    }

    first(){
        return this.a0;
    }

    curr(){
        return this.current;
    }

    setCurr(current){
        this.current = current;
    }

    at(n){
        this.first();
        for(let i = 0; i < n; i++)
            this.current = this.next();
        console.log(this.current);
    }

    print(n){
        this.first();
        for(let i = 0; i < n; i++){
            console.log(this.current);
            this.current = this.next();
        }
    }

}

class Arit extends Succ{

    constructor(a0, inc){
        super(a0);
        this.inc = inc;
    }

    next(){
        let v = super.curr() + this.inc;
        super.setCurr(v);
    }
}


class AritOpt extends Arit {

    constructor(a0, inc){
        super(a0);
        this.inc = inc;
    }

    at(n){
        let v = n*this.inc + this.a0;
        super.setCurr(v);
        console.log(v);
    }
}

class Geom extends Succ {
    constructor(a0, mult){
        super(a0);
        this.mult = mult;
    }

    next(){
        super.setCurr(super.curr() * this.mult);
        return super.curr();
    }
}

class Const extends Succ {
    constructor(a0){
        super(a0);
        this.const = a0;
    }

    next(){
        super.setCurr(this.const)
        return super.curr();
    }
}

class Composta extends Succ{

    constructor(s1, s2) {
        super(s1.first() + s2.first());
        this.s1 = s1;
        this.s2 = s2;
    }

    first(){
        return this.s1.first() + this.s2.first();
    }

    curr(){
        return this.s1.curr() + this.s2.curr();
    }

    next(){
        return this.s1.next() + this.s2.next();
    }
}

(new Composta((new Arit(2, 3)), (new Arit(2, 5)))).at(4);