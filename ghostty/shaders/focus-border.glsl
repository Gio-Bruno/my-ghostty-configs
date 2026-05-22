void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord.xy / iResolution.xy;
    vec4 color = texture(iChannel0, uv);

    if (iFocus <= 0) {
        fragColor = color;
        return;
    }

    float age = iTime - iTimeFocus;
    float visible = 1.0 - smoothstep(0.0, 0.45, age);
    if (visible <= 0.0) {
        fragColor = color;
        return;
    }

    float edge = min(
        min(fragCoord.x, iResolution.x - fragCoord.x),
        min(fragCoord.y, iResolution.y - fragCoord.y)
    );

    float pulse = 0.5 + 0.5 * sin(age * 28.0);
    float borderWidth = mix(2.0, 5.0, pulse);
    float border = 1.0 - smoothstep(borderWidth, borderWidth + 1.5, edge);
    float glow = 1.0 - smoothstep(0.0, 24.0, edge);

    vec3 blue = vec3(0.24, 0.55, 1.0);
    float alpha = visible * clamp(border * 0.85 + glow * 0.18, 0.0, 0.95);

    fragColor = vec4(mix(color.rgb, blue, alpha), color.a);
}
