<?php

return [

    'accepted' => ':attribute alanı kabul edilmelidir.',
    'accepted_if' => ':attribute alanı, :other değeri :value olduğunda kabul edilmelidir.',
    'active_url' => ':attribute alanı geçerli bir URL olmalıdır.',
    'after' => ':attribute alanı, :date ten sonraki bir tarih olmalıdır.',
    'after_or_equal' => ':attribute alanı, :date ten sonraki veya ona eşit bir tarih olmalıdır.',
    'alpha' => ':attribute alanı yalnızca harf içermelidir.',
    'alpha_dash' => ':attribute alanı yalnızca harf, rakam, tire ve alt çizgi içermelidir.',
    'alpha_num' => ':attribute alanı yalnızca harf ve rakam içermelidir.',
    'array' => ':attribute alanı, bir dizi.',
    'ascii' => ':attribute alanı yalnızca tek baytlık alfanümerik karakterler ve semboller içermelidir.',
    'before' => ':attribute alanı, :date ten önceki bir tarih olmalıdır.',
    'before_or_equal' => ':attribute alanı, :date ten önceki veya ona eşit bir tarih olmalıdır.',
    'between' => [
    'array' => ':attribute alanı, :min ile :max arasında öğe içermelidir.',
    'file' => ':attribute alanı, :min ile :max kilobayt arasında olmalıdır.',
    'numeric' => ':attribute alanı, :min ile :max arasında olmalıdır.',
    'string' => ':attribute alanı, :min ile :max arasında karakter olmalıdır.',
    ],
    'boolean' => ':attribute alanı doğru veya yanlış olmalıdır.',
    'can' => ':attribute alanı yetkisiz bir değer içeriyor.',
    'confirmed' => ':attribute alanı onayı eşleşmiyor.',
    'contains' => ':attribute alanında gerekli bir değer eksik.',
    'current_password' => 'Şifre yanlış.',
    'date' => ':attribute alanı geçerli bir tarih olmalıdır.',
    'date_equals' => ':attribute alanı :date e eşit bir tarih olmalıdır.',
    'date_format' => ':attribute alanı :format biçimiyle eşleşmelidir.',
    'decimal' => ':attribute alanında :decimal ondalık basamakları bulunmalıdır.',
    'declined' => ' :attribute alanı reddedilmelidir.',
    'declined_if' => ':attribute alanı, :other değeri :value olduğunda reddedilmelidir.',
    'different' => ':attribute alanı ve :other farklı olmalıdır.',
    'digits' => ':attribute alanı, :digits basamaklı olmalıdır.',
    'digits_between' => ':attribute alanı, :min ve :max basamaklı olmalıdır.',
    'dimensions' => ':attribute alanı geçersiz resim boyutlarına sahip.',
    'distinct' => ':attribute alanı yinelenen bir değere sahip.',
    'doesnt_end_with' => ':attribute alanı aşağıdakilerden biriyle bitmemelidir: :values.',
    'doesnt_start_with' => ':attribute alanı aşağıdakilerden biriyle başlamamalıdır: :values.',
    'email' => ':attribute alanı geçerli bir e-posta adresi olmalıdır.',
    'ends_with' => ':attribute alanı aşağıdakilerden biriyle bitmelidir: :values.',
    'enum' => 'Seçili :attribute geçersiz.',
    'exists' => 'Seçili :attribute geçersiz.',
    'extensions' => ':attribute alanı aşağıdaki uzantılardan birine sahip olmalıdır: :values.',
    'file' => ':attribute alanı bir dosya olmalıdır.',
    'filled' => ':attribute alanı bir değere sahip olmalıdır.',
    'gt' => [
    'array' => ':attribute alanı :value öğesinden fazlasına sahip olmalıdır.',
    'file' => ':attribute alanı :value kilobaytından büyük olmalıdır.',
    'numeric' => ':attribute alanı :value öğesinden büyük olmalıdır.',
    'string' => ':attribute alanı :value karakterlerinden büyük olmalıdır.',

    ],
    'gte' => [
    'array' => ':attribute alanı :value öğesi veya daha fazlasına sahip olmalıdır.',
    'file' => ':attribute alanı :value kilobaytından büyük veya ona eşit olmalıdır.',
    'numeric' => ':attribute alanı :value öğesinden büyük veya ona eşit olmalıdır.',
    'string' => ':attribute alanı :value karakterlerinden büyük veya ona eşit olmalıdır.',

    ],
    'hex_color' => ':attribute alanı geçerli bir onaltılık renk olmalıdır.',
    'image' => ':attribute alanı bir resim olmalıdır.',
    'in' => 'Seçili :attribute geçersiz.',
    'in_array' => ':attribute alanı :other da bulunmalıdır.',
    'integer' => ':attribute alanı bir tam sayı olmalıdır.',
    'ip' => ':attribute alanı geçerli bir IP adresi olmalıdır.',
    'ipv4' => ':attribute alanı geçerli bir IPv4 adresi olmalıdır.',
    'ipv6' => ':attribute alanı geçerli bir IPv6 adresi olmalıdır.',
    'json' => ':attribute alanı geçerli bir JSON dizesi olmalıdır.',
    'list' => 'The :attribute alanı bir liste olmalıdır.',
    'lowercase' => ':attribute alanı küçük harfli olmalıdır.',
    'lt' => [
    'array' => ':attribute alanı :value öğesinden az olmalıdır.',
    'file' => ':attribute alanı :value kilobaytından az olmalıdır.',
    'numeric' => ':attribute alanı :value öğesinden az olmalıdır.',
    'string' => ':attribute alanı :value karakterlerinden az olmalıdır.',

    ],
    'lte' => [
    'array' => ':attribute alanı :value öğesinden fazla olmamalıdır.',
    'file' => ':attribute alanı :value kilobaytından az veya ona eşit olmalıdır.',
    'numeric' => ':attribute alanı :value karakterinden az veya ona eşit olmalıdır.',
    'string' => ':attribute alanı :value karakterlerinden az veya ona eşit olmalıdır.',

    ],
    'mac_address' => ':attribute alanı geçerli bir MAC adresi olmalıdır.',
    'max' => [
    'array' => ':attribute alanı :max tan fazla öğeye sahip olmamalıdır.',
    'file' => ':attribute alanı :max kilobayttan fazla olmamalıdır.',
    'numeric' => ':attribute alanı :max tan fazla olmamalıdır.',
    'string' => ':attribute alanı :max karakterden fazla olmamalıdır.',
    ],
    'max_digits' => ':attribute alanı :max tan fazla rakama sahip olmamalıdır.',
    'mimes' => ':attribute alanı :values türünde bir dosya olmalıdır.',
    'mimetypes' => ':attribute alanı :values türünde bir dosya olmalıdır.',
    'min' => [
    'array' => ':attribute alanı en az :min öğeye sahip olmalıdır.',
    'file' => ':attribute alanı en az :min kilobayt olmalıdır.',
    'numeric' => ':attribute alanı en az :min olmalıdır.',
    'string' => ':attribute alanı en az :min karakter olmalıdır.',
    ],
    'min_digits' => ':attribute alanı en az :min rakama sahip olmalıdır.',
    'missing' => ':attribute alanı eksik olmalıdır.',
    'missing_if' => ':other, :value olduğunda :attribute alanı eksik olmalıdır.',
    'missing_unless' => ':other, :value olmadığı sürece :attribute alanı eksik olmalıdır.',
    'missing_with' => ':values mevcut olduğunda :attribute alanı eksik olmalıdır.',
    'missing_with_all' => ':values mevcut olduğunda :attribute alanı eksik olmalıdır.',
    'multiple_of' => ':attribute alanı, :value nin bir katı olmalıdır.',
    'not_in' => 'Seçili :attribute geçersiz.',
    'not_regex' => ' :attribute alan biçimi geçersiz.',
    'numeric' => ':attribute alanı bir sayı olmalıdır.',
    'password' => [
    'letters' => ':attribute alanı en az bir harf içermelidir.',
    'mixed' => ':attribute alanı en az bir büyük harf ve bir küçük harf içermelidir.',
    'numbers' => ':attribute alanı en az bir sayı içermelidir.',
    'symbols' => ':attribute alanı en az bir sembol içermelidir.',
    'uncompromised' => 'Belirtilen :attribute bir veri sızıntısında ortaya çıktı. Lütfen farklı bir :attribute seçin.',
    ],
    'present' => ':attribute alanı mevcut olmalıdır.',
    'present_if' => ':other, :value olduğunda :attribute alanı mevcut olmalıdır.',
    'present_unless' => ':other, :value olmadığı sürece :attribute alanı mevcut olmalıdır.',
    'present_with' => ':values ​​mevcut olduğunda :attribute alanı mevcut olmalıdır.',
    'present_with_all' => ':values ​​mevcut olduğunda :attribute alanı mevcut olmalıdır.',
    'prohibited' => ':attribute alanı yasaktır.',
    'prohibited_if' => ':other, :value olduğunda :attribute alanı yasaktır.',
    'prohibited_unless' => ':other, :values ​​içinde olmadığı sürece :attribute alanı yasaktır.',
    'prohibits' => ':attribute alanı yasaklar :other öğesinin mevcut olmasını engeller.',
    'regex' => ':attribute alan biçimi geçersiz.',
    'required' => ':attribute alanı zorunludur.',
    'required_array_keys' => ':attribute alanı: :values ​​için girişler içermelidir.',
    'required_if' => ':other öğesi :value olduğunda :attribute alanı zorunludur.',
    'required_if_accepted' => ':other öğesi kabul edildiğinde :attribute alanı zorunludur.',
    'required_if_declined' => ':other öğesi reddedildiğinde :attribute alanı zorunludur.',
    'required_unless' => ':other öğesi :values ​​içinde olmadığı sürece :attribute alanı zorunludur.',
    'required_with' => ':values ​​öğesi :attribute alanı zorunludur. mevcut.',
    'required_with_all' => ':değerler mevcut olduğunda :attribute alanı zorunludur.',
    'required_without' => ':değerler mevcut olmadığında :attribute alanı zorunludur.',
    'required_without_all' => ':değerlerden hiçbiri mevcut olmadığında :attribute alanı zorunludur.',
    'same' => ':attribute alanı :diğer ile eşleşmelidir.',
    'size' => [
    'array' => ':attribute alanı :size öğelerini içermelidir.',
    'file' => ':attribute alanı :size kilobayt olmalıdır.',
    'numeric' => ':attribute alanı :size olmalıdır.',
    'string' => ':attribute alanı :size karakter olmalıdır.',
    ],
    'starts_with' => ':attribute alanı aşağıdakilerden biriyle başlamalıdır: :values.',
    'string' => ':attribute alanı bir dize olmalıdır.',
    'timezone' => ':attribute alanı geçerli bir saat dilimi olmalıdır.',
    'unique' => ':attribute daha önce alınmış.',
    'uploaded' => ':attribute yüklenemedi.',
    'uppercase' => ':attribute alanı büyük harfle yazılmalıdır.',
    'url' => ':attribute alanı geçerli bir URL olmalıdır.',
    'ulid' => ':attribute alanı geçerli bir ULID olmalıdır.',
    'uuid' => ':attribute alanı geçerli bir UUID olmalıdır.',

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | Here you may specify custom validation messages for attributes using the
    | convention "attribute.rule" to name the lines. This makes it quick to
    | specify a specific custom language line for a given attribute rule.
    |
    */

    'custom' => [
        'attribute-name' => [
            'rule-name' => 'custom-message',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Attributes
    |--------------------------------------------------------------------------
    |
    | The following language lines are used to swap our attribute placeholder
    | with something more reader friendly such as "E-Mail Address" instead
    | of "email". This simply helps us make our message more expressive.
    |
    */

    'attributes' => [],

];
