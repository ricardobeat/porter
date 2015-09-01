(function(){

    var _slice = Array.prototype.slice

    function $ (sel, context) {
        return (context || document).querySelector(sel);
    }

    function $$ (sel, context) {
        return _slice.call((context || document).querySelectorAll(sel));
    }

    $$('[data-toggle]').forEach(function(el){
        el.addEventListener('click', function (e) {
            e.preventDefault()
            var self = e.target
            var toggle = $('#' + self.dataset.toggle)
            
            self.classList.toggle('active')
            toggle.classList.toggle('hidden')

        }, false)
    })
    
})();