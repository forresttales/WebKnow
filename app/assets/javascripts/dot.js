// Laura Doktorova https://github.com/olado/doT
(function() {
	function o() {
		var b = {
			"&" : "&#38;",
			"<" : "&#60;",
			">" : "&#62;",
			'"' : "&#34;",
			"'" : "&#39;",
			"/" : "&#47;"
		}, a = /&(?!#?\w+;)|<|>|"|'|\//g;
		return function(f) {
			return f ? f.toString().replace(a, function(g) {
				return b[g] || g
			}) : f
		}
	}

	function p(b, a, f) {
		return ( typeof a === "string" ? a : a.toString()).replace(b.define || h, function(g, e, c, i) {
			if (e.indexOf("def.") === 0)
				e = e.substring(4);
			if (!( e in f))
				if (c === ":")
					f[e] = i;
				else
					eval("def['" + e + "']=" + i);
			return ""
		}).replace(b.use || h, function(g, e) {
			var c = eval(e);
			return c ? p(b, c, f) : c
		})
	}

	function l(b) {
		return b.replace(/\\('|\\)/g, "$1").replace(/[\r\t\n]/g, " ")
	}

	var j = {
		version : "0.2.0",
		templateSettings : {
			evaluate : /\{\{([\s\S]+?)\}\}/g,
			interpolate : /\{\{=([\s\S]+?)\}\}/g,
			encode : /\{\{!([\s\S]+?)\}\}/g,
			use : /\{\{#([\s\S]+?)\}\}/g,
			define : /\{\{##\s*([\w\.$]+)\s*(\:|=)([\s\S]+?)#\}\}/g,
			conditional : /\{\{\?(\?)?\s*([\s\S]*?)\s*\}\}/g,
			iterate : /\{\{~\s*(?:\}\}|([\s\S]+?)\s*\:\s*([\w$]+)\s*(?:\:\s*([\w$]+))?\s*\}\})/g,
			varname : "it",
			strip : true,
			append : true,
			selfcontained : false
		},
		template : undefined,
		compile : undefined
	}, m = function() {
		return this || (0, eval)("this")
	}();
	if ( typeof module !== "undefined" && module.exports)
		module.exports = j;
	else if ( typeof define === "function" && define.amd)
		define(function() {
			return j
		});
	else
		m.doT = j;
	m.encodeHTML = o();
	var q = {
		append : {
			start : "'+(",
			end : ")+'",
			startencode : "'+encodeHTML("
		},
		split : {
			start : "';out+=(",
			end : ");out+='",
			startencode : "';out+=encodeHTML("
		}
	}, h = /$^/;
	j.template = function(b, a, f) {
		a = a || j.templateSettings;
		var g = a.append ? q.append : q.split, e, c = 0, i;
		if (a.use || a.define) {
			var r = m.def;
			m.def = f || {};
			b = p(a, b, m.def);
			m.def = r
		}
		b = ("var out='" + (a.strip ? b.replace(/(^|\r|\n)\t* +| +\t*(\r|\n|$)/g, " ").replace(/\r|\n|\t|\/\*[\s\S]*?\*\//g, "") : b).replace(/'|\\/g, "\\$&").replace(a.interpolate || h, function(n, d) {
			return g.start + l(d) + g.end
		}).replace(a.encode || h, function(n, d) {
			e = true;
			return g.startencode + l(d) + g.end
		}).replace(a.conditional || h, function(n, d, k) {
			return d ? k ? "';}else if(" + l(k) + "){out+='" : "';}else{out+='" : k ? "';if(" + l(k) + "){out+='" : "';}out+='"
		}).replace(a.iterate || h, function(n, d, k, s) {
			if (!d)
				return "';} } out+='";
			c += 1;
			i = s || "i" + c;
			d = l(d);
			return "';var arr" + c + "=" + d + ";if(arr" + c + "){var " + k + "," + i + "=-1,l" + c + "=arr" + c + ".length-1;while(" + i + "<l" + c + "){" + k + "=arr" + c + "[" + i + "+=1];out+='"
		}).replace(a.evaluate || h, function(n, d) {
			return "';" + l(d) + "out+='"
		}) + "';return out;").replace(/\n/g, "\\n").replace(/\t/g, "\\t").replace(/\r/g, "\\r").replace(/(\s|;|}|^|{)out\+='';/g, "$1").replace(/\+''/g, "").replace(/(\s|;|}|^|{)out\+=''\+/g, "$1out+=");
		if (e && a.selfcontained)
			b = "var encodeHTML=(" + o.toString() + "());" + b;
		try {
			return new Function(a.varname, b)
		} catch(t) {
			typeof console !== "undefined" && console.log("Could not create a template function: " + b);
			throw t;
		}
	};
	j.compile = function(b, a) {
		return j.template(b, null, a)
	}
})(); 