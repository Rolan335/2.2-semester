const Sequelize = require("sequelize")

const sequelize = new Sequelize("usersdb", "root", "Pa$$w0rd", {
    dialect: "mysql",
    host: "localhost",
    define: {
        timestamps: false
    }
})


const Student = sequelize.define("student", {
    id: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true,
        allowNull: false
    },
    name: {
        type: Sequelize.STRING,
        allowNull: false
    }
});

const Course = sequelize.define("course", {
    id: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true,
        allowNull: false
    },
    name: {
        type: Sequelize.STRING,
        allowNull: false
    }
})

const Enrolment = sequelize.define("enrolment", {
    id: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true,
        allowNull: false
    },
    grade: {
        type: Sequelize.INTEGER,
        allowNull: false
    }
})

Student.belongsToMany(Course, {through: Enrolment})
Course.belongsToMany(Student, {through: Enrolment })
// Coach.create({name: "Dinamo"}).then(coach=>{

//     Team.create({name:"Dinamo Moskva"}).then(team=>{
//         coach.setTeam(team).catch(err => console.log(err))
//     })
// }).catch(err=>console.log(err))

// sequelize.sync({ force: true }).then(() => {
//     console.log("Tables have been created");
// }).catch(err => console.log(err));

// Coach.findByPk(1).then(coach => {
//     if (!coach) return console.log("Coach not found")
//     coach.getTeam().then(team => {
//         console.log(coach.name, " - ", team.name)
//     })
// })

// Course.create({name: "Javascript"})
// Course.create({ name: "TypeScript" })
// Course.create({ name: "Node.js" })

// Student.create({ name: "Bob" })
// Student.create({ name: "Tom" })
// Student.create({ name: "Alice" })

Student.findOne({where: {name:"Tom"}}).then(student => {
    if (!student) return
    student.getCourses().then(courses => {
        for(course of courses){
            if(course.name==="Javascript") course.enrolment.destroy()
        }
    })
})