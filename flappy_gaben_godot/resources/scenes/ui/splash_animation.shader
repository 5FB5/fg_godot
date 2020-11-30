shader_type canvas_item;

void vertex() {
	VERTEX.xy += sin(TIME + VERTEX.xy ) * 2.8f;
}