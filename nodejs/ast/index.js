const acorn = require('acorn');
const walk = require('acorn-walk');

function checkMethodCalls(script) {
  const ast = acorn.parse(script, { ecmaVersion: 2020 });
  walk.simple(ast, {
    VariableDeclarator(node) {
      if (!node.init) {
        return;
      }
      let methodName;
      if (node.init.type === 'Identifier') {
        methodName = node.init.name;
      } else if (node.init.type === 'MemberExpression') {
        if (node.init.property.type === 'Identifier') {
          methodName = node.init.property.name;
        } else {
          // 属性赋值必须使用标识符写法，动态的一律拒绝
          throw new Error(`Not supported syntax`);
        }
      }
      // 禁止将危险方法赋值给变量
      if (isDangerousMethod(methodName)) {
        throw new Error(`Not supported syntax`);
      }
    },
    CallExpression(node) {
      let methodName;
      if (node.callee.type === 'Identifier') {
        methodName = node.callee.name;
      } else if (node.callee.type === 'MemberExpression') {
        console.log(node.callee.object.property.name);
        if (node.callee.property.type === 'Identifier') {
          methodName = node.callee.property.name;
        } else {
          // 方法调用必须使用标识符写法，动态的一律拒绝，比如 db.collection['method']
          throw new Error('Not supported syntax');
        }
      }
      if (isDangerousMethod(methodName, node.augments)) {
        throw new Error(`Dangerous method call: ${methodName}`);
      }
    }
  });
}

function isDangerousMethod(methodName, arguments) {
  const dangerousMethods = ['updateMany'];
  return dangerousMethods.includes(methodName);
}

const userScript = `
{
  const now = new Date();
  const s = db.scoreHistory;
  const u = s.updateMany;
  const result = u(
    {
      "accountId": ObjectId("6180ea32e0df4b1472704228"),
      "description": ["2402-InfiniteElite-购买701积分", "2402-InfiniteElite-购买701积分-退货退款"],
      "createdAt": { $gt: ISODate("2024-02-26T00:00:00+08:00") }
    },
    {
      $set: {
        "updatedAt": now
      }
    });
  printjson(result);
}
`;

try {
  checkMethodCalls(userScript);
  console.log('Script is safe');
} catch (error) {
  console.error('Script contains dangerous method calls:', error.message);
}
