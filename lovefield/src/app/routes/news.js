module.exports = app =>{
    app.get('/',(req,res)=>{
        res.render('hello world');
    });
}