$('.tlt').textillate({
    //当检测到多个文本动画时使用的默认选择器
    selector: '.tlt',

    // 启用循环
    loop: false,

    // 在替换之前设置每个文本的最小显示时间
    minDisplayTime: 1000,

    // 在开始动画之前设置初始延迟
    // (请注意，根据实际情况，您可能需要在运行此插件之前手动应用visibility: hidden属性来隐藏元素)
    initialDelay: 0,

    // 设置是否自动开始动画
    autoStart: true,

    // 定制的“in”效果。 无论角色是否在动画之前或之后显示/隐藏，都会产生影响
    inEffects: [],

    // 定制的“out”效果
    outEffects: ['hinge'],

    // in 动画设置
    in: {
        // 设置效果名称
        effect: 'bounce',

        // 设置应用于每个连续字符的延迟因子
        delayScale: 1.5,

        // 设置每个字符之间的延迟
        delay: 50,

        // 设置为true来同时为所有角色设置动画
        sync: false,

        // 随机化字符序列
        // (请注意，shuffle在sync = true时没有意义)
        shuffle: false,

        // 反转字符序列
        // (请注意，在sync = true时，反向没有任何意义)
        reverse: false,

        // 动画完成后执行的回调
        callback: function () { }
    },

    // out 动画设置。
    out: {
        effect: 'hinge',
        delayScale: 1.5,
        delay: 50,
        sync: false,
        shuffle: false,
        reverse: false,
        callback: function () { }
    },

    // 一旦textillate完成，就执行回调
    callback: function () { },

    // 设置标记动画的类型 (可用类型:"char"和"word")
    type: 'char'
});