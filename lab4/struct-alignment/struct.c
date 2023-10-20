struct stru_a {
    int a;      // 0x0
    char c[3];  // 0x4
    int b;      // 0x8
    void *d;    // 0x10
    int e;      // 0x18
		// Last: 0x1c, min(MaximumMemberSize, 8) == 8
		// After Alignment: 0x20
};

struct __attribute__((packed, aligned(4))) stru_b {
    int c;           // 0x00
    struct stru_a a; // 0x10
		     // 0x1c Pad to multiply of pack
    int b;           // 0x28
};

int main() {
    struct stru_a a[2];
    a[0].a = 1;
    a[0].b = 3;
    a[0].d = &a;
    a[0].e = 5;
    a[1].a = 1;
    a[1].b = 3;
    a[1].d = &a;
    a[1].e = 5;

    
    struct stru_b b;
    b.a.a = 1;
    b.a.b = 3;
    b.a.e = 5;
    b.b = 0x10;
    b.c = 9;
    return 0;
}
