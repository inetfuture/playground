interface User {
  name: string;
  id: number;
}

const user: User = {
  name: 'Aaron',
  id: 0,
};

class UserAccount {
  name: string;
  id: number;

  constructor(name: string, id: number) {
    this.name = name;
    this.id = id;
  }
}

const user1: User = new UserAccount('Aaron', 1);

function getAdminUser(): User {
  return null;
}

type MyBool = true | false;

type WindowStates = 'open' | 'closed' | 'minized';

function getLength(obj: string | string[]) {
  return obj.length;
}

type StringArray = Array<string>;

interface Backpack<Type> {
  add: (obj: Type) => void;
  get: () => Type;
}

declare const backpack: Backpack<string>;
const object = backpack.get();

interface Point2 {
  x: number;
  y: number;
}

interface Point {
  x: number;
  y: number;
}

function printPoint(p: Point) {
  console.log(`${p.x}, ${p.y}`);
}

const point = { x: 12, y: 26, z: 89 }
printPoint(point);
